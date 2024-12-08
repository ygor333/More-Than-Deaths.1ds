surf = noone;
momento = 0;


dia_noite = function()
{
	

	if (surface_exists(surf))
	{
		surface_set_target(surf);
		draw_set_alpha(.55);
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width, room_height, false);
		draw_set_alpha(1);
		draw_set_color(-1);
		
		
		// desenhando a luz da tocha
		
		if(instance_exists(Obj_tocha)){
			with(Obj_tocha){
				gpu_set_blendmode(bm_subtract);
				draw_circle(x,y,70 - irandom(1),false);
				
				
				draw_set_alpha(.5)
				draw_circle(x,y,80 - irandom(1),false);
				draw_set_alpha(1)
				
				
				
				gpu_set_blendmode(bm_normal);
			}
		
		}

	    surface_reset_target();
		draw_surface(surf, 0, 0)
	}
	else{
		surf = surface_create(room_width,room_height)
		
		
		
	
	}

}