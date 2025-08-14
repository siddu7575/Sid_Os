# Makefile to build main.asm

ASM = nasm
ASMFLAGS = -f bin
SRC = ../src/main.asm
BIN = main.bin

all: $(BIN)

$(BIN): $(SRC)
    $(ASM) $(ASMFLAGS) -o $(BIN) $(SRC)

run: $(BIN)
    qemu-system-i386 -drive format=raw,file=$(BIN)

clean:
    del main.bin