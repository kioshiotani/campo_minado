jmp main

; variaveis do cursor ------------------------------
cursor_start_pos   : var #1
cursor_pos         : var #1
cursor_prev_pos    : var #1
cursor_char        : var #2
cursor_char_status : var #1
cursor_color       : var #1


static cursor_start_pos, #0
static cursor_pos, #0
static cursor_prev_pos, #0
static cursor_char + #0, #'$'
static cursor_char + #1, #'%'
static cursor_char_status, #0
static cursor_color, #512
; --------------------------------------------------

; --------------------------------------------------
; main
; --------------------------------------------------
main:
    ;call draw_cursor
    halt

; --------------------------------------------------

; --------------------------------------------------
; draw_cursor
; --------------------------------------------------
draw_cursor:
    push FR
    push r0
    push r1
    push r2
    push r3

    ; carregar caractere do cursor
    load r0, cursor_char_status
    loadn r1, #0
    loadn r2, #cursor_char ;endereco do vetor de char
    cmp r0, r1
    jeq change_cursor_char 

    ;atualizar status do cursor
    loadn r0, #0
    store cursor_char_status, r0

   rts_change_cursor_char:
    loadi r3, r2 ;carregar char do cursor
    load r0, cursor_color ;carregar cor do cursor
    add r3, r3, r0 ;colocar cor no cursor
    load r0, cursor_pos ;carregar posicao do cursor

    ;desenhar cursor na tela
    outchar r3, r0 

    jmp draw_cursor_end

    change_cursor_char:
    ;atualizar o status do cursor
    loadn r0, #1
    store cursor_char_status, r0

    ;trocar o char do cursor
    inc r2 ;apontar para a pos 1 do vetor


    jmp rts_change_cursor_char
    
    draw_cursor_end:
    pop r3
    pop r2
    pop r1
    pop r0
    pop FR
    rts
; --------------------------------------------------




; mapa ---------------------------------------------

mapa_bloco : var #1
mapa_borda : var #1

static mapa_bloco, #'&'
static mapa_borda, #'#' 

mapa0  : string "                                        "
mapa1  : string "                                        "
mapa2  : string "                                        "
mapa3  : string "                                        "
mapa4  : string "                                        "
mapa5  : string "           #####################        "
mapa6  : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa7  : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa8  : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa9  : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa10 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa11 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa12 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa13 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa14 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa15 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa16 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa17 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa18 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa19 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa20 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa21 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa22 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa23 : string "           #&&&&&&&&&&&&&&&&&&&#        "
mapa24 : string "           #####################        "
mapa25 : string "                                        "
mapa26 : string "                                        "
mapa27 : string "                                        "
mapa28 : string "                                        "
mapa29 : string "                                        "
; --------------------------------------------------
