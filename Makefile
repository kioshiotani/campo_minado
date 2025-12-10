CC = gcc
CFLAGS = -w

DIR_SIM = simulador_fonte
DIR_ASM = montador_fonte

BIN_SIM = $(DIR_SIM)/sim
BIN_ASM = $(DIR_ASM)/montador

GAME_SRC = game.asm
GAME_OUT = game.mif
CHARMAP  = charmap.mif

.PHONY: all clean play install assembly

all: $(BIN_SIM) $(BIN_ASM)

$(BIN_ASM): $(DIR_ASM)/*.c
	@echo "--- Compilando o Montador ---"
	$(CC) $(CFLAGS) $(DIR_ASM)/*.c -o $(BIN_ASM)

$(BIN_SIM):
	@echo "--- Compilando o Simulador ---"
	cd $(DIR_SIM) && sh compila.sh > /dev/null 2>&1

%.mif: %.asm $(BIN_ASM)
	@echo "--- Montando $< ---"
	$(BIN_ASM) $< $@

assembly: $(GAME_OUT)

play: $(GAME_OUT) $(BIN_SIM)
	@echo "--- Iniciando Simulação ---"
	$(BIN_SIM) $(GAME_OUT) $(CHARMAP)

clean:
	@echo "--- Limpando arquivos gerados ---"
	rm -f $(GAME_OUT) $(BIN_ASM) $(BIN_SIM)
