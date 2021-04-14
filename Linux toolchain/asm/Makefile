NASM     = nasm
CC      ?= gcc
CFLAGS  += -Wall
TARGETS  = $(patsubst %.asm,%,$(wildcard *.asm))

all: $(TARGETS)

clean:
	rm -f $(TARGETS)
	rm -f *.o

%.o: %.asm
	$(NASM) -f elf $(NASM_FLAGS) $< -o $@

%: %.o
	$(LD) -m elf_i386 $< -o $@
