#region parado

function scr_olho_parado() {
    if (state_timer > 0) {
        enemy_vision_angle = irandom_range(0, 359);
        enemy_vision_range_focus = 256;
    }
    if (state_timer == 0) {
        sprite_index = sprites.parado;
        state_timer = state_duration;
        estado = scr_olho_andando;
    }
    state_timer = clamp(state_timer - 1, 0, state_duration);
}


#endregion

function scr_olho_andando() {
    var _movex = lengthdir_x(walk_speed, enemy_vision_angle);
    var _movey = lengthdir_y(walk_speed, enemy_vision_angle);
    if(_movex>0){image_xscale=-1}
	else{image_xscale=1}

    move_and_collide(_movex, _movey, obj_no_touch, 5);

    var _collision = collision_line(x, y, x + lengthdir_x(50, enemy_vision_angle), y + lengthdir_y(50, enemy_vision_angle), obj_no_touch, 0, 1);
    if (_collision != noone) {
        enemy_vision_angle += 180 + irandom_range(0, 90);
    }
    if (state_timer == 0) {
        state_timer = state_duration;
        sprite_index = sprites.parado;
        estado = scr_olho_parado;
    }
    state_timer = clamp(state_timer - 1, 0, state_duration);
}



function scr_olho_atacar() {
    if (morto) return; // Se o inimigo estiver morto, sair da função

    if (Obj_player.x > x) {
        image_xscale = -1;
    } else {
        image_xscale = 1;
    }

    var _targetx = Obj_player.x + ((attack_range / 4 * 3) * image_xscale);
	


    // If the boss is not attacking, it moves towards the target
    if (!atacando) {
        sprite_index = sprites.andando;
        enemy_vision_angle = point_direction(x, y, _targetx, Obj_player.y);
        mp_potential_step_object(_targetx , Obj_player.y  , run_speed, obj_no_touch);
    }
	var _ataque = false;
	var _ataque = false;
    if (!_ataque && cooldown_timer == 0) {
        _ataque = true; // Boss can attack
        run_speed = 1
    }
    if (_ataque or atacando) {
        // Can attack
		if alarm[1] <= 0 {
            // Randomly choose an attack type
           var _tp_atk =choose(scr_esfera, scr_feixe_4) // Adjust the range based on the number of attack types (0 and 1 in this case)
            estado = _tp_atk
            run_speed = 0;
			alarm[1] = 100
        }
		
    }else{
	estado = scr_olho_andando	
	}
}


function scr_esfera() {
    // Fase de espera
    if (attack_phase == 0 && cooldown_timer == 0) {
        // Fase de espera
        atacando = true;
        sprite_index = sprites.atacando;
        if (floor(image_index) == 12) {
            attack_phase = 1; // Muda para a fase de ataque
            image_speed = 0;
        }
    }

    if (attack_phase == 1 && floor(image_index) == 12) {
        if (cooldown_timer == 0) {
            sprite_index = sprites.atacando;
            instance_create_layer(x, y, "enemy", obj_esfera);
            loop_cont += 1;
            cooldown_timer = 30; // Tempo de espera entre ataques
        }

        // Verifica se o ataque foi feito 3 vezes
        if (loop_cont >= 2) {
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

function scr_feixe_4() {
    if (attack_phase == 0 && cooldown_timer == 0) {
        // Fase de espera
        atacando = true;
        sprite_index = sprites.atacando;
        if (floor(image_index) == 8) {
            attack_phase = 1; // Muda para a fase de ataque
            image_speed = 0;
        }
    }

    if (attack_phase == 1 && floor(image_index) == 8) {
        if (cooldown_timer == 0) {
            sprite_index = sprites.atacando;
			cooldown_timer = attack_cooldown; // Tempo de espera entre ataques
			repeat(4){
				var _xx = irandom_range(x-150,x + 150)
				var _yy = irandom_range(y-150,y + 150)
				instance_create_layer(_xx,_yy,"enemy",obj_bola_1)

			
			
			
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
        estado = scr_olho_atacar;
    }

    // Gerencia o cooldown_timer
    if (cooldown_timer > 0) {
        cooldown_timer -= 1;
    }
}