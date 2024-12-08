/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
script_execute(menu_pause)

if key_pause{
	if room != pause_1{
		if instance_exists(Obj_player){
			Obj_player.persistent = false;
			is_pause = true;
			instance_activate_all();
			
		}
		room_previous(room);
		room_goto(pause_1);
	}else{
		room_goto_previous();
		instance_deactivate_all(true);
	
	
	}
		
}
			