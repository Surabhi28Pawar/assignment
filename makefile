TARGET = main
SRC = src
INC = inc
BIN = bin
OBJS  = objs

SOURCE = $(wildcard $(SRC)/*.c)

_OBJ_FILES = file_1.0 main.o
OBJECT = $(patsubst %,$(OBJS)/%, $(_OBJ_FILES))


CC = gcc
CFLAGS = -Wall -std=gnu99 -Iinc

$(BIN)/$(TARGET) : $(OBJECT)
	$(CC) -o $@ $^

$(BIN)/%.o : $(SRC)/%.c
	$(CC) $(CFLAGS) -C $< -o $@

help :
	@echo "src: $(SOURCE)"
	@echo "obj: $(OBJECT)"
clean :
	rm objs/* bin/*
