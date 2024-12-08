/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !instance_exists(obj_inimigos) && !instance_exists(obj_inimigos_2)
{
	if (!instance_exists(Obj_trnasicao)){
	
	instance_create_layer(0,0,layer,Obj_trnasicao, { destino: seletor_fase})
	global.fase[1] = status_bloqueio.desbloqueado
	
}
	
}

