
hspd = 0;
vspd = 0;
move_dir = 0;
move_spd = 0;
move_spd_max = 3.25;
acc = 0.3;
dcc = 0.3;
estado = scr_player_andando;
inimigos_atingidos = ds_list_create();
dash_start_power = 8
dash_dir = -1
dash_momentum = 0.3
dash_power = 0


dash_distace = 100;
dash_time = 10

velcdir = -1

max_estamina = 400
estamina = max_estamina
stamina_dash_cost = 40;
foice = 0

ataque = 0
atacando=false
atacado=false
ataque_distancia = 32 


iframes = 20
iframe = 0
dano = 30;
arma_dano = 1;
ataque_dano = arma_dano * dano 


max_poder = 0;
global.poder = max_poder


especial = false

inimigo = [obj_inimigos, obj_inimigos_2, obj_boss_par, obj_vul_par]

_move_x = keyboard_check(ord("D"))-keyboard_check(ord("A"));
_move_y = keyboard_check(ord("S"))-keyboard_check(ord("W"));


dir="esquerda"

// Inicialização das variáveis
arma_atual = 0; // 0 para a arma padrão, 1 para a nova arma
transformando = false; // Estado de transformação
tempo_transformacao = 0; // Contador para a transformação
arma_dano = 1; 

atacar = false;
sprites_player={
	ataque1:Spr_ataque_1,
	ataque2:Spr_ataque_2,
	ataque3:Spr_ataque_3,
	Spr_andando_esquerda:Spr_correndo_esquerda,
	Spr_andando_direita:Spr_correndo_direita,
	Spr_direita:Spr_parado_direita,
	Spr_esquerda:Spr_parado_esquerda
	
}

xp = 0
level = 1
max_xp[1] = 100;
max_xp[2] = 150;
max_xp[3] = 200;
max_xp[4] = 250;
max_xp[5] = 300;

dano = 10
dano[1] = 10
dano[2] = 20
dano[3] = 30
dano[4] = 40
dano[5] = 50

max_life = 100
global.life_player=max_life
/*
max_life[1] = 100;
max_life[2] = 150;
max_life[3] = 200;
max_life[4] = 250;
max_life[5] = 300;
global.life_player=max_life[level];
*/


// Evento Step do jogador
