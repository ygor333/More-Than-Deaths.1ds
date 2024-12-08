
//movi
#region parado

function scr_boss_parado()
{
	if(state_timer>0)
	{
		enemy_vision_angle=irandom_range(0,359)
		enemy_vision_range_focus=256
	}
	if(state_timer==0)
	{
		sprite_index=sprites.andando
		state_timer=state_duration
		estado=scr_boss_andando
	}
	state_timer=clamp(state_timer-1,0,state_duration)
}



#endregion

#region anadando
function scr_boss_andando()
{
	var _movex = lengthdir_x(walk_speed,enemy_vision_angle)
	var _movey = lengthdir_y(walk_speed,enemy_vision_angle)
	if(_movex>0){image_xscale=-1}
	else{image_xscale=1}
	move_and_collide(_movex,_movey,obj_no_touch,5)
	
	var _collision = collision_line(x,y,x+lengthdir_x(50,enemy_vision_angle),y+lengthdir_y(50,enemy_vision_angle),obj_no_touch,0,1)
	if(_collision!=noone)
	{
		enemy_vision_angle += 180
		enemy_vision_angle += irandom_range(0,90)
	}
	if(state_timer==0)
	{
		state_timer=state_duration
		sprite_index=sprites.parado
		estado=scr_boss_parado
	}
	state_timer=clamp(state_timer-1,0,state_duration)
}
#endregion






//ataque
#region Script para atacar
function scr_boss_atacar() {
    // Set the direction of the boss based on the player's position
    if (Obj_player.x > x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }

    // Calculate the target position for the attack
    var _targetx = Obj_player.x + ((attack_range / 4 * 3) * image_xscale);
    var _targety = Obj_player.y + ((attack_range / 4 * 3) * image_xscale);

    // If the boss is not attacking, it moves towards the target
    if (!atacando) {
        sprite_index = sprites.andando;
        enemy_vision_angle = point_direction(x, y, _targetx, _targety);
        mp_potential_step_object(_targetx *2, _targety *2, run_speed, obj_no_touch);
    }

    // Attack logic
    var _ataque = false;
    if (!_ataque && cooldown_timer == 0) {
        _ataque = true; // Boss can attack
        run_speed = 0;
    }

    if (_ataque or atacando) {
        if alarm[1] <= 0 {
            // Randomly choose an attack type
           var _tp_atk = choose(scr_circulo , scr_feixe,scr_feixe_3) // Adjust the range based on the number of attack types (0 and 1 in this case)
            estado = _tp_atk
            run_speed = 0;
			alarm[1] = 100
        }
    } else {
        estado = scr_boss_andando;
    }
}
#endregion

#region Ataque do Peixe
function scr_feixe() {
    if (attack_phase == 0 && cooldown_timer == 0) {
        // Fase de espera
        atacando = true;
        sprite_index = sprites.feixe;
        if (floor(image_index) == 8) {
            attack_phase = 1; // Muda para a fase de ataque
            image_speed = 0;
        }
    }

    if (attack_phase == 1 && floor(image_index) == 8) {
        if (cooldown_timer == 0) {
            sprite_index = sprites.feixe;
            instance_create_layer(x, y, "enemy", obj_feixe);
            loop_cont += 1;
            cooldown_timer = 30; // Tempo de espera entre ataques
        }

        // Verifica se o ataque foi feito 3 vezes
        if (loop_cont >= 3) {
            attack_phase = 2; // Move to shrinking phase
        }
    }

    if (attack_phase == 2) {
        // Fase de encolhimento
        atacando = false;
        loop_cont = 0; // Reset loop counter
        cooldown_timer = attack_cooldown; // Reset cooldown timer
        attack_phase = 0; // Volta para a fase de espera
        image_speed = 1; // Restart sprite animation
    }

    if (!atacando) {
        image_speed = 1;
        run_speed = 0;
        estado = scr_boss_atacar;
    }

    // Gerencia o cooldown_timer
    if (cooldown_timer > 0) {
        cooldown_timer -= 1;
    }
}
#endregion

#region Ataque do circulo
function scr_circulo() {
    if (attack_phase == 0 && cooldown_timer == 0) {
        // Fase de espera
        atacando = false;
        sprite_index = sprites.atacando_circulo;
        if (floor(image_index) == 4) {
            attack_phase = 1; // Muda para a fase de ataque
            image_speed = 0;
        }
    } else if (attack_phase == 1) {
		
        // Fase de ataque
        // Aumenta o tamanho do círculo até o máximo
        circle_radius += circle_expansion_speed;
        circle_radius = min(circle_radius, max_radius); // Impede que o círculo ultrapasse o tamanho máximo

        // Verifica colisão com o jogador
        if (point_distance(x, y, Obj_player.x, Obj_player.y) <= circle_radius) {
            // Aplica dano ao jogador
            if (Obj_player.iframe == 0) {
                global.life_player -= 10;
                Obj_player.iframe = Obj_player.iframes; // Dano fixo, você pode ajustar conforme necessário
            }
        }

        // Aumenta o temporizador do ataque
        attack_timer += 0.7;

        // Quando o círculo atingir o máximo, muda para a fase de encolhimento
        if (attack_timer >= attack_duration) {
            circle_radius = max_radius; // Garante que o círculo atinja o tamanho máximo
            is_shrinking = true; // Começa a encolher o círculo
            attack_phase = 2; // Muda para a fase de encolhimento
        }
    } else if (attack_phase == 2) {
        // Fase de encolhimento
        circle_radius = 0; // Define o raio para 0 imediatamente
        cooldown_timer = attack_cooldown; // Define o cooldown para o próximo ataque
        // Resetando variáveis para permitir novo ataque
        atacando = false;
        is_shrinking = false;
        attack_timer = 0;
        attack_phase = 0; // Volta para a fase de espera
    } else {
         if (attack_phase == 0) {
        image_speed = 1; // Fase de espera
    } else if (attack_phase == 1 || attack_phase == 2) {
        image_speed = 0; // Fase de ataque ou encolhimento
    }

        run_speed = 0;
        estado = scr_boss_atacar;
    }
}
#endregion

#region Ataque das bolas
function scr_feixe_3() {
    if (attack_phase == 0 && cooldown_timer == 0) {
        // Fase de espera
        atacando = true;
        sprite_index = sprites.feixe2;
        if (floor(image_index) == 8) {
            attack_phase = 1; // Muda para a fase de ataque
            image_speed = 0;
        }
    }

    if (attack_phase == 1 && floor(image_index) == 8) {
        if (cooldown_timer == 0) {
            sprite_index = sprites.feixe2;
			cooldown_timer = attack_cooldown; // Tempo de espera entre ataques
			repeat(6){
				var _xx = irandom_range(x-150,x + 150)
				var _yy = irandom_range(y-150,y + 150)
				instance_create_layer(_xx,_yy,"enemy",obj_bola)

			
			
			
			}
		}

        // Verifica se o ataque foi feito 3 vezes
        else {
            attack_phase = 2; // Move to shrinking phase
        }
    }

    if (attack_phase == 2) {
        // Fase de encolhimento
        atacando = false;
        
        cooldown_timer = attack_cooldown; // Reset cooldown timer
        attack_phase = 0; // Volta para a fase de espera
        image_speed = 1; // Restart sprite animation
    }

    if (!atacando) {
        image_speed = 1;
        run_speed = 0;
        estado = scr_boss_atacar;
    }

    // Gerencia o cooldown_timer
    if (cooldown_timer > 0) {
        cooldown_timer -= 1;
    }
}
#endregion