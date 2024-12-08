draw_self()
if (alpha > 0) {
    // Caso você queira usar a névoa (fog), você deve usar as funções corretas, como gpu_set_fog
    gpu_set_fog(true, color, 0, 0);  
    
    // Desenha o sprite com a transparência (alpha)
    draw_sprite_ext(sprite_index, 0, x, y, image_xscale, 1, 0, c_white, alpha);
    
    gpu_set_fog(false, color, 0, 0); 
}