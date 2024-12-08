/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()
// Obj_circulo Draw Event
// Obj_circulo Draw Event
// Aumentar o raio do círculo gradativamente

if (attack_radius < max_radius) {
    attack_radius += growth_speed;
}
if (attack_radius > max_radius) {
    attack_radius = max_radius;  // Corrige o valor do raio
}

draw_set_color(c_red);  // Define a cor do círculo (vermelho)
draw_circle(x, y, attack_radius, true);  // Desenha o círculo preenchido com o raio atualizado
draw_set_color(c_white);  // Reseta a cor para o padrão