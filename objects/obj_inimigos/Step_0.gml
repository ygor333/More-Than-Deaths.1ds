
if(collision_raycast(x,y,enemy_vision_angle,enemy_vision_range,30,8,Obj_player)!=noone)
{
	if(collision_line(x,y,x+lengthdir_x(256,point_direction(x,y,Obj_player.x,Obj_player.y)),x+lengthdir_y(256,point_direction(x,y,Obj_player.x,Obj_player.y)),obj_no_touch,true,true)!=noone)
	{
		estado=scr_inimigo_atacar
		enemy_player_attack_timer=300
	}
}


script_execute(estado)

iframe = clamp(iframe-1,0,iframes)


if (iframe > 0) {
    iframe -= 1; 
	alpha = 1; 
	run_speed = 0

} else {
	run_speed = 1

    
}
alpha = lerp(alpha,0,0.1)

/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (life <= 0 ) {
	sprite_index = Spr_espada_morrendo; // Muda o sprite para a animação de morte
	estado = false
	if (!morto){
    atacando = false;
    morto = true;
    run_speed = 0; // Para o movimento
    image_speed =1; // Inicia a animação de morte
	iframe = -1
	global.poder += 5;
	
	
	}
}


// Verifica se o objeto está morto e se a animação de morte terminou

if (fim_da_animacao()) {
    
	// Reseta o estado para a próxima tentativa de ataque
    if (morto){
	
	run_speed = 0;
    image_speed = 0;
	
    Obj_player.xp += 50; // Adiciona 50 pontos de experiência ao jogador
    instance_destroy(); // Destrói a instância do inimigo
	}
}


