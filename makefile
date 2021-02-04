TARGET = main
SRC = src
INC = inc
BIN = bin
OBJS  = objs
#LIB =  lib
#LIBFILE = libmylib.a

SOURCE = $(wildcard $(SRC)/*.c)
#SOURE = file_1.c file_2.c main.c
#_OBJ_FILES = file_1.0 file_2.o main.o
OBJECT = $(patsubst %,$(OBJS)/%, $(notdir $(SOURCE:'c=.o)))


CC = gcc
CFLAGS = -Wall -std=gnu99 -Iinc

$(BIN)/$(TARGET) : $(OBJECT) 
	$(CC) -o $@ $^

$(OBJS)/%.o : $(SRC)/%.c
	$(CC) $(CFLAGS) -C $< -o $@

#$(LIB)/$(LIBFILE):
#	ar rcs $@ $(OBJS)/*.o
help :
	@echo "src: $(SOURCE)"
	@echo "obj: $(OBJECT)"
clean :
	rm objs/* bin/*
