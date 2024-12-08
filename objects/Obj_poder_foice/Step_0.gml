// Step

// Defina o dano a ser aplicado e a duração do iframe
var dano = 30;

// Verifica se está colidindo com qualquer tipo de inimigo e aplica dano
var inimigos = [obj_inimigos, obj_inimigos_2, obj_boss_par, obj_vul_par]; // Lista de inimigos

for (var i = 0; i < array_length(inimigos); i++) {
    var inimigo = inimigos[i];
    
    // Verifica se a instância colidiu com o inimigo
    var colisao = instance_place(x, y, inimigo);
    
    // Se houve colisão e o inimigo não está em iframe
    if (colisao != noone && colisao.iframe == 0) {
        colisao.life -= dano; // Aplica dano ao inimigo
        colisao.iframe = colisao.iframes; // Reseta o iframe do inimigo
        instance_destroy(); // Destrói a instância atual após aplicar o dano
    }
}
