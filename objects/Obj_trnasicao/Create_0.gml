
tamanho = sprite_get_width(Spr_transicao)

cols  = ceil(room_width / tamanho);

lins = ceil( room_height / tamanho)


// variaveis para animação das sprites
//imgaem inicial
img = 0;


// vel da animação

img_vel = sprite_get_speed(Spr_transicao) / game_get_speed(gamespeed_fps);

//total da animação
img_num = sprite_get_number(Spr_transicao) -  1;

// mandar para outra room


//VAriavel de  Controle para saber se estou saindo ou entrando
entrando = true;


