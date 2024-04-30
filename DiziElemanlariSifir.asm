.data
.align 2
YENI_DIZI: .space 48
DIZI:	.word 2, 0, -4, -16, 0, 1, -8, -10, 0, 2, -3, 11
msg1: .asciiz "Yeni dizi elemanlar?:  "
msg2: .asciiz "   "

.text
.globl main
main:
# Dizinin taban adresini alma
la $s0,DIZI
la $s2,YENI_DIZI

add $t0,$zero,$zero
add $t8,$zero,$zero
add $t7,$zero,$zero
addi $s5,$zero,12

dongu:
beq $t0,$s5,yazmadongusu
sll $t5,$t0,2
add $t1,$t5,$s0
lw $s1,0($t1)
addi $t0,$t0,1
slt $t2,$s1,$zero
bne $t2,$zero,depola
j dongu

depola:
sll $t6,$t8,2
add $t4,$t6,$s2
sw $s1,0($t4)
addi $t8,$t8,1
j dongu

yazmadongusu:
la $a0,msg1
addi $v0,$zero,4
syscall

add $s4,$zero,$zero

yazma:
beq $s4,$t8,cikis

sll $t1,$s4,2
add $t2,$t1,$s2
lw $t3,0($t2)

add $a0,$zero,$t3
addi $v0,$zero,1
syscall

la $a0,msg2
addi $v0,$zero,4
syscall

addi $s4,$s4,1
j yazma
cikis:

addi $v0,$zero,10
syscall
