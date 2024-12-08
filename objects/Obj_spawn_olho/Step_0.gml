/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if (!variable_global_exists("olho")) {
    global.olho = false; // Inicializa a variável global se não existir
}

// Verifica se todos os inimigos foram derrotados
if (!instance_exists(obj_inimigos) && !instance_exists(obj_inimigos_2) && global.ativar == true){
    if (!global.olho) { // Verifica se o boss ainda não foi criado
        instance_create_layer(x, y, "enemy", obj_vul); // Cria o boss
        global.olho = true; // Marca que o boss foi criado
    }
} else {
    global.olho = false; // Reseta a variável se ainda houver inimigos
}