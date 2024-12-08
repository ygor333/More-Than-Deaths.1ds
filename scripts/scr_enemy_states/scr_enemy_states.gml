#region parado



function scr_inimigo_parado()
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
		estado=scr_inimigo_andando
	}
	state_timer=clamp(state_timer-1,0,state_duration)
}

#endregion


#region andando

function scr_inimigo_andando()
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
		estado=scr_inimigo_parado
	}
	state_timer=clamp(state_timer-1,0,state_duration)
}


#endregion




function scr_inimigo_atacar()
{
	if (morto) return; // Se o inimigo estiver morto, sair da função
	if(Obj_player.x>x){image_xscale=-1}
	else{image_xscale=1} // direção
	
	var _targetx = Obj_player.x+((attack_range/4*3)*image_xscale) // posição do ataque
	
	if((Obj_player.x-x)*sign(Obj_player.x-x)>attack_range or (Obj_player.y-y)*sign(Obj_player.y-y)>2)
	{
		if(!atacando)
		{
			sprite_index=sprites.andando
			enemy_vision_angle=point_direction(x,y,_targetx,Obj_player.y)
			mp_potential_step_object(_targetx,Obj_player.y,run_speed,obj_no_touch)
		}
	} // verifica o alcance
	else
	{
		var _ataque = false
		if(!((Obj_player.x-x)*sign(Obj_player.x-x)>attack_range or (Obj_player.y-y)*sign(Obj_player.y-y)>2))
		{
			var _ataque = true
		} // pode atacar
		
		if(_ataque or atacando)
		{
			atacando=true
			sprite_index = sprites.atacando
			atacando=true
			if (atacando) {
    sprite_index = sprites.atacando;

    if (floor(image_index) == 5 && !atacado) { 
        atacado = true; // Garante que o dano só é aplicado uma vez por ataque

        #region Colisão e Aplicação de Dano
        var _colididos = ds_list_create();
        collision_rectangle_list( x + 35, y + 12, x + (32 * -image_xscale), y - 12, Obj_player, false, true, _colididos, true);
        
        if (!ds_list_empty(_colididos)) {
            for (var _i = 0; _i < ds_list_size(_colididos); _i += 1) {
                var _alvo = ds_list_find_value(_colididos, _i);

                // Aplica dano somente se o iframe do alvo permitir
                if (_alvo.iframe == 0) {
                    global.life_player -= dano_ataque;
					_alvo.iframe = _alvo.iframes
                  
                }
            }
        }
        ds_list_destroy(_colididos);
        #endregion
    }

    // Reset do ataque ao final da animação
    if (fim_da_animacao()) {
        atacando = false;
        atacado = false; // Reseta o estado para a próxima tentativa de ataque
    }
}

				}
			}
		}