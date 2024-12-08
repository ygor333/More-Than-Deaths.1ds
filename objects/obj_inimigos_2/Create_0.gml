

estado=scr_inimigo_parado
max_dist = 200;
life_max=100
life=life_max
walk_speed=1
run_speed= 0.5
state_duration=120
state_timer=state_duration

stamina=150
color = c_white
alpha = 0

morrendo= 0
morto = false


enemy_vision_range = 200
enemy_vision_range_focus = 256
enemy_vision_angle = 0

iframes = 20
iframe = 0

enemy_player_attack_timer = 0
attack_range=35
atacar=false
atacando=false
atacado=false


dano = 10
dano_arma = 2
dano_ataque = dano * dano_arma



sprites=
{
	parado:spr_parado_maca,
	andando:spr_andando_maca,
	atacando:spr_ataque_maca,
	inimigo_hit:spr_dano_maca
}