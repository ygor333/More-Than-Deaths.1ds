if(collision_raycast(x,y,enemy_vision_angle,enemy_vision_range,30,8,Obj_player)!=noone)
{
	if(collision_line(x,y,x+lengthdir_x(256,point_direction(x,y,Obj_player.x,Obj_player.y)),x+lengthdir_y(256,point_direction(x,y,Obj_player.x,Obj_player.y)),Obj_parede,true,true)!=noone)
	{
		estado=scr_boss_atacar
		enemy_player_attack_timer=300
	}
}

if (cooldown_timer > 0) {
    cooldown_timer -= 1;
}
script_execute(estado)

iframe = clamp(iframe-1,0,iframes)
cooldown_timer = clamp(cooldown_timer-1,0,attack_cooldown)

if (iframe > 0) {
	
    iframe -= 1; 
	alpha = 1; 
	

}
alpha = lerp(alpha,0,0.1)
// Evento Step do inimigo


