/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (place_meeting(x, y, Obj_player)) {
    mostrar_texto = true;
    
    // Verificar se a tecla "R" foi pressionada
    if (keyboard_check_pressed(ord("R"))) {
		global.pocao += 1
        coletado = true;
        mostrar_texto = false; // Ocultar o texto após a coleta
		instance_destroy()
    }
} else {
    mostrar_texto = false; // Ocultar o texto se não estiver em colisão
}
