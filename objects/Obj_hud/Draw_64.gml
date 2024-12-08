#region life

// Verifique se a vida do jogador é válida antes de desenhar
if (global.life_player >= 0) {
    // Calcula o índice do sprite com base na vida do jogador
    var life_sprite_index = global.life_player div 10; // Usa divisão inteira para obter o índice

    // Garante que o índice do sprite não ultrapasse 10
    if (life_sprite_index > 10) {
        life_sprite_index = 10;
    }

    // Desenha o sprite correspondente
    draw_sprite(spr_life_player, life_sprite_index, 0, -30);
}
#endregion
#region life_boss


 

if (instance_exists(obj_boss_par)) {
    // Determina a vida do boss
    var life = obj_boss_par.life;
    var max_life = 1500; // Vida máxima do boss
    var life_percentage = (life / max_life) * 100; // Calcula a porcentagem de vida
    var _sprite_index = -1; // Inicializa o índice do sprite

    // Define o índice do sprite com base na porcentagem de vida
    if (life_percentage >= 100) {
        _sprite_index = 0; // 100% a 95.83% vida
    } else if (life_percentage >= 95.83) {
        _sprite_index = 1; // 95.82% a 91.67% vida
    } else if (life_percentage >= 91.67) {
        _sprite_index = 2; // 91.66% a 87.50% vida
    } else if (life_percentage >= 87.50) {
        _sprite_index = 3; // 87.49% a 83.33% vida
    } else if (life_percentage >= 83.33) {
        _sprite_index = 4; // 83.32% a 79.17% vida
    } else if (life_percentage >= 79.17) {
        _sprite_index = 5; // 79.16% a 75.00% vida
    } else if (life_percentage >= 75.00) {
        _sprite_index = 6; // 74.99% a 70.83% vida
    } else if (life_percentage >= 70.83) {
        _sprite_index = 7; // 70.82% a 66.67% vida
    } else if (life_percentage >= 66.67) {
        _sprite_index = 8; // 66.66% a 62.50% vida
    } else if (life_percentage >= 62.50) {
        _sprite_index = 9; // 62.49% a 58.33% vida
    } else if (life_percentage >= 58.33) {
        _sprite_index = 10; // 58.32% a 54.17% vida
    } else if (life_percentage >= 54.17) {
        _sprite_index = 11; // 54.16% a 50.00% vida
    } else if (life_percentage >= 50.00) {
        _sprite_index = 12; // 49.99% a 45.83% vida
    } else if (life_percentage >= 45.83) {
        _sprite_index = 13; // 45.82% a 41.67% vida
    } else if (life_percentage >= 41.67) {
        _sprite_index = 14; // 41.66% a 37.50% vida
    } else if (life_percentage >= 37.50) {
        _sprite_index = 15; // 37.49% a 33.33% vida
    } else if (life_percentage >= 33.33) {
        _sprite_index = 16; // 33.32% a 29.17% vida
    } else if (life_percentage >= 29.17) {
        _sprite_index = 17; // 29.16% a 25.00% vida
    } else if (life_percentage >= 25.00) {
        _sprite_index = 18; // 24.99% a 20.83% vida
    } else if (life_percentage >= 20.83) {
        _sprite_index = 19; // 20.82% a 16.67% vida
    } else if (life_percentage >= 16.67) {
        _sprite_index = 20; // 16.66% a 12.50% vida
    } else if (life_percentage >= 12.50) {
        _sprite_index = 21; // 12.49% a 8.33% vida
    } else if (life_percentage >= 8.33) {
        _sprite_index = 22; // 8.32% a 4.17% vida
    } else if (life_percentage > 0 ) {
        _sprite_index = 22; // 4.16% a
	} else if (life_percentage <= 0) {
        _sprite_index = 22; // 4.16% a 0.01% vida
    } 
    if (_sprite_index != -1) {
        draw_sprite(spr_life_boss, _sprite_index, 650, 600);
    }
}else if room == fase_2{
draw_text(455,600,"-- DERROTE TODOS INIMIGOS PARA ENFRETAR O BOSS --")

}
#endregion


if (instance_exists(obj_vul_par)) {
    // Determina a vida do boss
    var life = obj_vul_par.life;
    var max_life = 1000; // Vida máxima do boss
    var life_percentage = (life / max_life) * 100; // Calcula a porcentagem de vida
    var _sprite_index = -1; // Inicializa o índice do sprite

    // Define o índice do sprite com base na porcentagem de vida
    if (life_percentage >= 94.45) {
        _sprite_index = 0; // 100% a 94.45% vida
    } else if (life_percentage >= 88.89) {
        _sprite_index = 1; // 94.44% a 88.89% vida
    } else if (life_percentage >= 83.34) {
        _sprite_index = 2; // 88.88% a 83.34% vida
    } else if (life_percentage >= 77.78) {
        _sprite_index = 3; // 83.33% a 77.78% vida
    } else if (life_percentage >= 72.23) {
        _sprite_index = 4; // 77.77% a 72.23% vida
    } else if (life_percentage >= 66.67) {
        _sprite_index = 5; // 72.22% a 66.67% vida
    } else if (life_percentage >= 61.12) {
        _sprite_index = 6; // 66.66% a 61.12% vida
    } else if (life_percentage >= 55.56) {
        _sprite_index = 7; // 61.11% a 55.56% vida
    } else if (life_percentage >= 50.01) {
        _sprite_index = 8; // 55.55% a 50.01% vida
    } else if (life_percentage >= 44.45) {
        _sprite_index = 9; // 50.00% a 44.45% vida
    } else if (life_percentage >= 38.90) {
        _sprite_index = 10; // 44.44% a 38.90% vida
    } else if (life_percentage >= 33.34) {
        _sprite_index = 11; // 38.89% a 33.34% vida
    } else if (life_percentage >= 27.79) {
        _sprite_index = 12; // 33.33% a 27.79% vida
    } else if (life_percentage >= 22.23) {
        _sprite_index = 13; // 27.78% a 22.23% vida
    } else if (life_percentage >= 16.68) {
        _sprite_index = 14; // 22.22% a 16.68% vida
    } else if (life_percentage >= 11.12) {
        _sprite_index = 15; // 16.67% a 11.12% vida
    } else if (life_percentage >= 5.57) {
        _sprite_index = 16; // 11.11% a 5.57% vida
    } else if (life_percentage > 0) {
        _sprite_index = 17; // 5.56% a 0.01% vida
    } else {
        _sprite_index = 18; // 0% vida
    }

    // Se um índice válido foi encontrado, desenhe o sprite correspondente
    if (_sprite_index != -1) {
        draw_sprite(spr_life_olho, _sprite_index, 650, 600);
    }
}

else if room == fase_1{
draw_text(455,600,"-- DERROTE TODOS INIMIGOS PARA ENFRETAR O BOSS --")

}

if (global.poder >= 0) {
    // Determina o poder do jogador
    var _poder = global.poder;
    var max_poder = 50; // Defina o poder máximo
    var poder_percentage = (_poder / max_poder) * 100; // Calcula a porcentagem de poder
    var _poder_sprite_index = -1; // Inicializa o índice do sprite

    // Define o índice do sprite com base na faixa de poder
    if (_poder >= 40) {
        _poder_sprite_index = 3; // 40 ou mais
    } else if (_poder >= 30) {
        _poder_sprite_index = 2; // 30 a 39
    } else if (_poder >= 20) {
        _poder_sprite_index = 1; // 20 a 29
    } else {
        _poder_sprite_index = 0; // 0 a 19
    }

    // Se um índice válido foi encontrado, desenhe o sprite correspondente
    if (_poder_sprite_index != -1) {
        draw_sprite(spr_especial, _poder_sprite_index, -30, 10);
    }
}


if room == fase_teste{
draw_text(455,600,"-- DERROTE TODOS INIMIGOS PARA PASSAR DE FASE --")

}

draw_text(20,600,"[ L ] - DASH")

draw_text(20,575,"[ Q ] - SE CURAR")

draw_text(20,625,"[ J ] - ATTACK")

draw_text(20,650,"[ W,A,S,D ] - MOVE")

draw_text(20,675,"[ E ] - TROCA DE ARMA")

if Obj_player.arma_atual == 1{

draw_self()
draw_text(20,700,"[ K ] - PODER")

}

if (global.pocao >= 0) {
    if (global.pocao >= 3) {
        draw_sprite(cheia_2, image_index, 50, 160);
    } else if (global.pocao == 2) {
        draw_sprite(cheia_1, image_index, 50, 160);
    } else if (global.pocao == 1) {
        draw_sprite(spr_meio_vazia, image_index, 50,160 );
    } else if global.pocao <= 0 { // global.pocao <= 0
        draw_sprite(Spr_pocao_vazia, image_index, 50, 160);
    }
}




