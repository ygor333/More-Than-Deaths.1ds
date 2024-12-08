depth = 50000000000

if (entrando) {
	
    draw_self(); 
}

for (var i = 0; i < lins; i++){
	
	for ( var j = 0; j < cols; j++)
	{	
	var _img = min(max(0, img - j), img_num)
	// usando o ponto posterior da tela/ caso queira a inferior so somar a cols
	draw_sprite_ext(Spr_transicao, _img , j * tamanho, i *  tamanho, 1 ,1, 0 , c_black, 1)
	
	}
 

}
