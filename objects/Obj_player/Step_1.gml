if(global.life_player<=0)
{
	instance_destroy(self)
}

if (!instance_exists(Obj_player)) {
    room_goto(menu);
    game_restart()
}

