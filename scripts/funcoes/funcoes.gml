function fim_da_animacao() {
    var _sprite = sprite_index;
    var _image = image_index;
    if (argument_count > 0) _sprite = argument[0];
    if (argument_count > 1) _image = argument[1];
    var _type = sprite_get_speed_type(sprite_index);
    var _spd = sprite_get_speed(sprite_index) * image_speed;
    if (_type == spritespeed_framespersecond)
        _spd = _spd / room_speed;
    if (argument_count > 2) _spd = argument[2];
    return _image + _spd >= sprite_get_number(_sprite);
}

function draw_raycast(_x,_y,_angle,_length,_amplitude,_quantity)
{
	for(var _i = 0; _i<=(_quantity-1); _i+=1)
	{
		var _angle_ray = (_amplitude/2)-_amplitude
		_angle_ray += (_amplitude/(_quantity-1))*_i
		_angle_ray+=_angle
		draw_line(_x,_y,_x+lengthdir_x(_length,_angle_ray),_y+lengthdir_y(_length,_angle_ray))
	}
}

function collision_raycast(_x,_y,_angle,_length,_amplitude,_quantity,_obj)
{
	var _collision = noone
	for(var _i = 0; _i<=_quantity; _i+=1)
	{
		var _angle_ray = (_amplitude/2)-_amplitude
		_angle_ray += (_amplitude/(_quantity-1))*_i
		_angle_ray+=_angle
		_collision = collision_line(_x,_y,_x+lengthdir_x(_length,_angle_ray),_y+lengthdir_y(_length,_angle_ray),_obj,false,true)
		if(_collision!=noone)
		{
			return _collision
		}
	}
	return noone
}

function collision_raycast_list(_x,_y,_angle,_length,_amplitude,_quantity,_obj,_list)
{
	var _num = 0
	for(var _i = 0; _i<=_quantity; _i+=1)
	{
		var _angle_ray = (_amplitude/2)-_amplitude
		_angle_ray += (_amplitude/(_quantity-1))*_i
		_angle_ray+=_angle
		_num += collision_line_list(_x,_y,_x+lengthdir_x(_length,_angle_ray),_y+lengthdir_y(_length,_angle_ray),_obj,false,true,_list,false)
	}
	return _num
}
function menu_pause(){
key_pause =  keyboard_check_pressed(vk_escape)
key_volume_maior = keyboard_check_pressed(vk_up)
key_volume_manor = keyboard_check_pressed(vk_down)
	

}
