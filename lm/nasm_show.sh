program=$(echo $1 | sed 's/.asm//g')
nasm -f elf -o $program.o $program.asm
ld -m elf_i386 -s -o $program $program.o
./$program
echo $'\nresult: '$?