if (!variable_global_exists("pause")) {
    global.pause = false;
}

if (global.pause) {
	image_speed = 0
    exit;
}
else{
	image_speed = 1;
	
	
}
script_execute(estado)


if alarm[1] =- 0{estamina += 10000}

estamina = clamp(estamina,0, max_estamina)



if (global.pocao >= 1) {
    if (keyboard_check_pressed(ord("Q"))) {
        global.life_player += 30;
        global.pocao -= 1; // Corrigido para subtrair 1
    }
}



toamndo_dano();


#region troca de arma

troca_de_arma();
#endregion


#region LEVEL
/*
if xp >= max_xp[level]{
level +=1;


global.life_player=max_life[level];

xp = xp - max_xp[level];
}

#endregion
*/



 