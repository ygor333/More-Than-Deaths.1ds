estado=scr_inimigo_parado

max_dist = 200;
life_max=100
life=life_max
walk_speed=1
run_speed= 2
state_duration=120
state_timer=state_duration
attack_duration =60
stamina=150


enemy_vision_range = 250
enemy_vision_range_focus = 256
enemy_vision_angle = 0

iframes = 20
iframe = 0

enemy_player_attack_timer = 0
attack_range=45
atacar=false
atacando=false
atacado=false
dano = 10
dano_arma = 1
dano_ataque = dano * dano_arma

alpha = 0
color = c_white
morto = false

alarm[0] = 3


sprites=
{
	inimigo_hit:spr_dano_maca,
	parado:spr_esqueleto,
	andando:spr_esqueleto_andando,
	atacando:spr_esqueleto_ataque
}