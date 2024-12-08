/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
script_execute(menu_pause)

if global.currentVolume != global.volume{
	global.currentVolume = global.volume;
	var num = audio_get_listener_count();
	for (var i = 0; i < num; ++i;)
	{
		var _info = audio_get_listener_info(i);
		var ind = _info[?"index"]
		audio_set_master_gain(_info[?"index"], global.currentVolume/10)
		ds_map_destroy(_info);
	
	
	}



}
// Checando a existência das instâncias prioritárias
if (instance_exists(obj_boss_par)) {
    if (global.destino_music != global.Som_fase_4) {
        // Pausar a música atual se houver uma tocando
        if (global.destino_music != noone) {
            audio_pause_sound(global.destino_music);
        }
        // Ajustar a nova música
        global.destino_music = global.Som_fase_4;
        audio_play_sound(global.destino_music, 10, true); // Volume 10, loop true
    }
} else if (instance_exists(obj_vul_par)) {
    if (global.destino_music != global.Som_fase_3) {
        // Pausar a música atual se houver uma tocando
        if (global.destino_music != noone) {
            audio_pause_sound(global.destino_music);
        }
        // Ajustar a nova música
        global.destino_music = global.Som_fase_3;
        audio_play_sound(global.destino_music, 10, true); // Volume 10, loop true
    }
} else if (room == menu || room == seletor_fase) {
    if (global.destino_music != global.Som_menu) {
        // Pausar a música atual se houver uma tocando
        if (global.destino_music != noone) {
            audio_pause_sound(global.destino_music);
        }
        // Ajustar a nova música
        global.destino_music = global.Som_menu;
        audio_play_sound(global.destino_music, 10, true); // Volume 10, loop true
    }
} else if (room == fase_teste || room == fase_1) {
    if (global.destino_music != global.Som_fase_1) {
        // Pausar a música atual se houver uma tocando
        if (global.destino_music != noone) {
            audio_pause_sound(global.destino_music);
        }
        // Ajustar a nova música
        global.destino_music = global.Som_fase_1;
        audio_play_sound(global.destino_music, 10, true); // Volume 10, loop true
    }
} else if (room == fase_2) {
    if (global.destino_music != global.Som_fase_2) {
        // Pausar a música atual se houver uma tocando
        if (global.destino_music != noone) {
            audio_pause_sound(global.destino_music);
        }
        // Ajustar a nova música
        global.destino_music = global.Som_fase_2;
        audio_play_sound(global.destino_music, 10, true); // Volume 10, loop true
    }
}

