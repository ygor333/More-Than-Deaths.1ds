if (life <= 0) {

    if (!instance_exists(Obj_trnasicao)){
	
	instance_create_layer(0,0,layer,Obj_trnasicao, { destino: global.foda})
	
}
	global.fase[2] = status_bloqueio.desbloqueado
	instance_destroy()
}

