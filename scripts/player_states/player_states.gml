// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações


function scr_colissao(){
if place_meeting(x + hspd, y, Obj_parede){
	while !place_meeting(x + sign(hspd), y, Obj_parede){
		x+= sign(hspd);
	}
	hspd= 0;
}

x += hspd; 



if place_meeting(x,y + vspd, Obj_parede){
	while !place_meeting(x,y + sign(vspd), Obj_parede){
		y += sign(vspd);
	}
	
	vspd = 0;
}
y += vspd;
}


// colidi



#region andar

function scr_player_andando()
{
	var _move_x = keyboard_check(ord("D"))-keyboard_check(ord("A"));
	var _move_y = keyboard_check(ord("S"))-keyboard_check(ord("W"));
	
	
	if(_move_x!=0 or _move_y!=0)
	{
		move_dir = point_direction(0,0,_move_x, _move_y);
		move_spd = approach(move_spd,move_spd_max,acc)
		
		if(_move_x!=0)
		{
			
			if(_move_x>0){dir="direita"}
			else{dir="esquerda"}
		}
		if(dir="direita"){sprite_index=sprites_player.Spr_andando_direita}
		if(dir="esquerda"){sprite_index=sprites_player.Spr_andando_esquerda}
	}
	else
	{
		move_spd = approach(move_spd,0,acc)
		if(dir="direita"){sprite_index=sprites_player.Spr_direita}
		if(dir="esquerda"){sprite_index=sprites_player.Spr_esquerda}
	}
	hspd = lengthdir_x(move_spd,move_dir);
	vspd = lengthdir_y(move_spd,move_dir);
	
	

	scr_colissao();
	var _especial =  keyboard_check_pressed(ord("K"))
	var _ataque = keyboard_check_pressed(ord("J"))
	var _dance = keyboard_check_pressed(ord("V"))
	var _key_dash = keyboard_check_pressed(ord("L"))
	if(_ataque)
	{
		if(dir="direita"){image_index = 1}
		if(dir="esquerda"){image_index= -1}
		estado = scr_ataque;
	}
#region especial
if arma_atual == 1{
	 if global.poder >= 10{	
	 if _especial  { 
		 especial = true
		 global.poder -= 10
		 
	 
	 
	 }
	 }
	 if (especial ) {
    // Se o estado 'especial' estiver ativo e o ataque ainda não foi realizado
	if !instance_exists(Obj_poder_foice){
    instance_create_layer(x, y, "player", Obj_poder_foice); // Cria o projétil
	}
else {
	especial = false 



}
 }
}
#endregion	

	if(_dance)
	{
		sprite_index = Spr_danca
		estado = scr_dance;
	}
	
	if(estamina >= stamina_dash_cost and _key_dash)
	{
		estamina-=stamina_dash_cost
		estado = scr_dash
		dash_dir = point_direction(0,0,_move_x,_move_y)
	}
	estamina=clamp(estamina+1,0,max_estamina)
}

#endregion

#region dash

function scr_dash()
{
	if(dir="direita"){sprite_index=Spr_dash_direita}
	if(dir="esquerda"){sprite_index=spr_dash_esquerda}
    image_speed = 1;

	if(dash_power==0)
	{
		dash_power=dash_start_power
		
		iframe = iframes
	}
	if _move_x !=0 {x= _move_x}
	

    hspd = lengthdir_x(dash_power, dash_dir);
    vspd = lengthdir_y(dash_power, dash_dir);

	scr_colissao();

	dash_power=clamp(dash_power-dash_momentum,0,dash_start_power)

    if (dash_power == 0)
	{
		estado = scr_player_andando
		iframe = 0
	}    
}

#endregion

#region ataque

function scr_ataque() {
    var _ataque = keyboard_check(ord("J"));

    if (dir == "direita") { image_xscale = 1; }
    if (dir == "esquerda") { image_xscale = -1; }

    if (_ataque or atacando) {
		
        atacando = true;

        // Função para lidar com a colisão e dano
        function aplicar_dano(ataque_dano) {
            var _colididos = ds_list_create();
            collision_rectangle_list(x, y + 12, x + (ataque_distancia * image_xscale), y - 12, inimigo, false, true, _colididos, true);
            if (!ds_list_empty(_colididos)) {
                for (var _i = 0; _i < ds_list_size(_colididos); _i += 1) {
                    var _alvo = ds_list_find_value(_colididos, _i);
				
                    if (_alvo.iframe == 0) {
                        _alvo.life -= ataque_dano;
                        _alvo.iframe = _alvo.iframes
						
						global.poder += 1; 
						
                    }
                }
				ds_list_destroy(_colididos);
            }
            
        }

        if (ataque == 0) {
            sprite_index = sprites_player.ataque1;
            if (atacado) {
                aplicar_dano(ataque_dano);
                atacando = false;
                atacado = false;
                ataque++;
            }
        }
        else if (ataque == 1) {
            sprite_index = sprites_player.ataque2;
            if (atacado) {
                aplicar_dano(ataque_dano + 10); // Dano adicional no segundo ataque
                atacando = false;
                atacado = false;
                ataque++;
            }
        }
        else if (ataque == 2) {
            sprite_index = sprites_player.ataque3;
            if (atacado) {
                aplicar_dano(ataque_dano + 10); 
                atacando = false;
                atacado = false;
				

                
                ataque = 0; 
				

				
            }
        }

    } else {
        ataque = 0; 
        image_xscale = 1; 
        estado = scr_player_andando;
    }
}	

#endregion




		

function toamndo_dano(){
	if (iframe > 0) {
    iframe -= 1; 
	    image_alpha = 0.4;  
	} else {
	    image_alpha = 1; 
	}




}
function  troca_de_arma(){
var _troca = keyboard_check_pressed(ord("E"))
	if (_troca && !transformando)  {
		
		
        transformando = true; // Ativa o estado de transformação
        tempo_transformacao = 0; // Reseta o contador
		
        sprite_index = Spr_transformacao; 
}

	
	if (transformando && !atacando && !atacado && !atacar) {
	
    //o contador de tempo
    tempo_transformacao += 10;
	sprite_index = Spr_transformacao// Ou use um valor maior para aumentar a duração

    if (tempo_transformacao >= 10 && image_index >= image_number -1 ) { 
        if (arma_atual == 0) {
            // Muda para a arma 1
            arma_atual = 1;
            ataque_distancia = 55;
			arma_dano = 2; 
			

          
            sprites_player = {
                ataque1: spr_foice1,
                ataque2: spr_foice2,
                ataque3: spr_foice1,
                Spr_andando_esquerda: foice_coreendo_esquerda,
                Spr_andando_direita: foice_correndo_direita,
                Spr_direita: foice_parado_direita,
                Spr_esquerda: foice_parado_esquerda
				
            };
			

        } else {
          
            arma_atual = 0;
			ataque_distancia = 32;
			arma_dano = 1; 
			
			

           
            sprites_player = {
                ataque1: Spr_ataque_1,
                ataque2: Spr_ataque_2,
                ataque3: Spr_ataque_3,
                Spr_andando_esquerda: Spr_correndo_esquerda,
                Spr_andando_direita: Spr_correndo_direita,
                Spr_direita: Spr_parado_direita,
                Spr_esquerda: Spr_parado_esquerda
            };
        }

       
		
		scr_player_andando()
        transformando = false;
    }
}

}
	



#region dança

function scr_dance()
{
	var _dance = keyboard_check(ord("V"))
	if(!_dance)
	{
		estado=scr_player_andando
	}
}




#endregion






