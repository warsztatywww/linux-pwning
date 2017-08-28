
%.64.o: %.64.asm
	yasm -g dwarf2 -f elf64 -o $@ $<

%.64: %.64.o
	gcc -static -m64 -o $@ $<

%.32.o: %.32.asm
	yasm -g dwarf2 -f elf64 -o $@ $<

%.32: %.32.o
	gcc -static -m32 -o $@ $<

