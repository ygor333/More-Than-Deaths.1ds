/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self()

event_inherited();

// Verificar se deve mostrar o texto
if (mostrar_texto && !coletado) {
    // Aplicar a fonte menor
    draw_set_font(fnt_smal);
    // Desenhar o texto
    draw_text(x- 30, y + 20, "Aperte R para coletar");
    // Redefinir a fonte para a fonte padrão (opcional, caso outras partes do desenho usem uma fonte diferente)
    draw_set_font(-1);
}