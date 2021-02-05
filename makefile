TARGET= main

SRC= src
INC= inc
BIN= bin
OBJS= objs
LIB= lib
LIBFILES= libfiles.a


SOURCE = $(wildcard $(SRC)/*.c)

_OBJ_FILES= file_1.o file_2.o main.o
OBJECT = $(patsubst %,$(OBJS)/%,$(_OBJ_FILES))

CC= gcc 
CFLAGS= -Wall -Iinc -std=gnu99

$(BIN)/$(TARGET) : $(OBJECT)
	$(CC) -o $@ $^

$(OBJS)/%.o : $(SRC)/%.c
	$(CC) -fPIC $(CFLAGS) -c $< -o $@

$(LIB)/$(LIBFILES): $(OBJECT) 
	$(CC) -o $@ $^
clean :
	rm objs/* bin/*

