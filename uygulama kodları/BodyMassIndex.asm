.data
.align 2
msg1: .asciiz "Enter your height: "
msg2: .asciiz "Enter your weight: " 
msg3: .asciiz "Your body mass index is: "
msg4: .asciiz "\nSo, it's: "
msgo: .asciiz " --Overweight-- "
msgn: .asciiz " --Normal-- "
msgu: .asciiz " --Underweight-- "
num1: .float 18.5
num2: .float 25.0
num3: .float 0.0

.text
.globl main
main:
la $a0,msg1
addi $v0, $zero, 4
syscall

addi $v0,$zero, 6
syscall
mov.s $f1,$f0

la $a0,msg2
addi $v0,$zero, 4
syscall

addi $v0,$zero, 6
syscall
mov.s $f2,$f0

mul.s $f3,$f1,$f1
div.s $f3,$f2,$f3

lwc1 $f10,num1
lwc1 $f11,num2
lwc1 $f12,num3

la $a0,msg3
addi $v0,$zero,4
syscall

mov.s $f12,$f3
addi $v0,$zero,2
syscall

la $a0,msg4
addi $v0,$zero,4
syscall

c.le.s $f3,$f11		# $f11 --> 25.0
bc1f LO
c.lt.s $f3,$f10		# $f10 --> 18.5
bc1t LU
j LN

LO: la $a0,msgo
addi $v0,$zero,4
syscall
j exit

LU: la $a0,msgu
addi $v0,$zero,4
syscall
j exit

LN: la $a0,msgn
addi $v0,$zero,4
syscall

exit:
addi $v0,$zero,10
syscall
