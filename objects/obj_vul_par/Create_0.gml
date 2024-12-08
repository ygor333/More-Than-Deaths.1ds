estado=scr_olho_parado

max_dist = 200;

global.foda = seletor_fase




 is_shrinking = false; // Flag para indicar que o círculo está desaparecendo
 attack_duration = 120; // Duração do ataque (em frames), ajuste conforme necessário
 attack_timer = 0; // Temporizador do ataque
 attack_phase = 0; // Fase do ataque (0 = esperando, 1 = atacando)

animation_duration = 30; // Duração da animação de ataque
attack_cooldown = 120; // Tempo de cooldown entre ataques (em frames)
cooldown_timer = 0; // Temporizador de cooldown


walk_speed=1
run_speed=1
state_duration=120
state_timer=state_duration
attack_duration = 60
stamina=150;

tp_atk = 0; 
loop_cont = 0


life_max=1000
life=life_max


cooldown_feixe = 0 


enemy_vision_range = 400
enemy_vision_range_focus = 256
enemy_vision_angle = 0

iframes = 20
iframe = 0

enemy_player_attack_timer = 0
attack_range=120
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



// Marcar que o círculo de ataque ainda está aumentando
increasing = true;

sprites=
{
	atacando:spr_olho_atacando,
	esfera:spr_poder_olho,
	parado:spr_olho,
	andando:spr_olho
}