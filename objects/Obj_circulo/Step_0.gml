// Obj_circulo Create Event

// Aumenta o raio até o valor máximo
if (attack_radius < max_radius) {
    attack_radius += growth_speed;  // Cresce gradativamente
}

// Garante que o raio não ultrapasse o valor máximo
if (attack_radius > max_radius) {
    attack_radius = max_radius;  // Corrige o valor do raio
}
var alvo = collision_circle(x, y, attack_radius, Obj_player, false, true);

