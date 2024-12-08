// No evento de clique do mouse
if (botao_ligado) {
    audio_stop_sound(global.destino_music); // Pausa a música
    botao_ligado = false
	sprite_index = Spr_bt_desligado
} else {
    audio_play_sound(global.destino_music, 1, true); 
	botao_ligado = true
	sprite_index = Spr_bt_volume
}

