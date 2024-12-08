/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if fim_da_animacao(){
	repeat(4){
	var _dir = 0;
	
	repeat(4){
	var _inst = instance_create_layer(x,y,"enemy", Obj_pode_feixe_2);
	_inst.speed = 2;
	_inst.direction = _dir;
	
	
	_dir += 90;
	
	
	}
	
	
	}

	instance_destroy();
}