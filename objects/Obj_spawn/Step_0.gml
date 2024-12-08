
// Verifica se todos os inimigos foram derrotados
if (!instance_exists(obj_inimigos) && !instance_exists(obj_inimigos_2) && global.ativar1 == true){
    if (!global.boss_criado) { // Verifica se o boss ainda não foi criado
        instance_create_layer(x, y, "enemy", obj_boss_par); // Cria o boss
        global.boss_criado = true; // Marca que o boss foi criado
    }
} else {
    global.boss_criado = false; // Reseta a variável se ainda houver inimigos
}

