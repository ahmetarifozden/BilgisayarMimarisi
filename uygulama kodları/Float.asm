.data
msg1: .asciiz "Enter a fp"
msg2: .asciiz "\nEnter the second fp"
msg3: .asciiz "\nThe sum is: "

.text
.globl main
main:
la $a0,msg1
addi $v0,$zero,4
syscall

addi $v0,$zero,6
syscall
mov.s $f1,$f0

la $a0,msg2
addi $v0, $zero,4
syscall

addi $v0,$zero,6
syscall
mov.s $f2,$f0

add.s $f3,$f1,$f2

la $a0,msg3
addi $v0,$zero,4
syscall

mov.s $f12,$f3
addi $v0,$zero,2
syscall

addi $v0, $zero, 10
syscall
