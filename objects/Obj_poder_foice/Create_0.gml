/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var min_dist = 10000; // Valor grande inicial
var target = noone; // Inicializa a variável do alvo

// Verifica todos os obj_inimigos na sala
with (obj_inimigos) {
    var dist = point_distance(other.x, other.y, x, y);
    if (dist < min_dist) {
        min_dist = dist;
        target = id;
    }
}

// Verifica todos os obj_inimigos_2 na sala
with (obj_inimigos_2) {
    var dist = point_distance(other.x, other.y, x, y);
    if (dist < min_dist) {
        min_dist = dist;
        target = id;
    }
}

// Verifica todos os obj_boss_par na sala
with (obj_boss_par) {
    var dist = point_distance(other.x, other.y, x, y);
    if (dist < min_dist) {
        min_dist = dist;
        target = id;
    }
}

with (obj_vul_par) {
    var dist = point_distance(other.x, other.y, x, y);
    if (dist < min_dist) {
        min_dist = dist;
        target = id;
    }
}

// Se encontrou um alvo, define a direção para o alvo
if (target != noone) {
    direction = point_direction(x, y, target.x, target.y);
    speed = 1.5;
    image_angle = direction;
} else {
    // Caso não tenha encontrado nenhum alvo, define valores padrão ou destrói o projétil
    instance_destroy();
}