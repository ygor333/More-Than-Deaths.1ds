estado=scr_boss_parado


max_dist = 200;



circle_radius = 0;
 max_radius = 200;  // Tamanho máximo do círculo
 circle_expansion_speed = 2.5; // Velocidade de expansão
circle_shrink_speed = 10; // Velocidade de desaparecimento
 is_shrinking = false; // Flag para indicar que o círculo está desaparecendo
 attack_duration = 120; // Duração do ataque (em frames), ajuste conforme necessário
 attack_timer = 0; // Temporizador do ataque
 attack_phase = 0; // Fase do ataque (0 = esperando, 1 = atacando)

animation_duration = 30; // Duração da animação de ataque
attack_cooldown = 240; // Tempo de cooldown entre ataques (em frames)
cooldown_timer = 0; // Temporizador de cooldown


walk_speed=1
run_speed=1
state_duration=120
state_timer=state_duration
attack_duration = 60
stamina=150;

tp_atk = 0; 
loop_cont = 0


life_max=1500
life=life_max


cooldown_feixe = 0 


enemy_vision_range = 400
enemy_vision_range_focus = 256
enemy_vision_angle = 0

iframes = 20
iframe = 0

enemy_player_attack_timer = 0
attack_range=150
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


// Evento Create do obj_attack_circle
attack_radius = 50; // Raio inicial
max_attack_radius = 200; // Raio máximo
growth_rate = 2; // Taxa de crescimento do círculo

// Define a posição onde o círculo de ataque foi criado
center_x = x;
center_y = y;

// Marcar que o círculo de ataque ainda está aumentando
increasing = true;

sprites=
{
	feixe:ataque_feixe,
	feixe2:spr_ataque_feixe,
	inimigo_hit:spr_dano_maca,
	parado:parado_e_fase1,
	andando:esquerda_fase1,
	atacando_circulo:ataque01_e
}