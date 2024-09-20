.data
.align 2
Array: .space 4000
Msg1: .asciiz "Enter the positive integer to be converted to binary: "
Msg2: .asciiz "Binary representation is: "
#-----------------------------------------------------------------------------#
.text
.globl main
main:
la $s7, Array

la $a0, Msg1
add $v0, $zero, 4
syscall

add $v0, $zero, 5
syscall

add $s0, $zero, $v0		# Number --> $s0
addi $t9, $zero, 2
add $t2, $zero, $zero		# Counter variable

Loop:
div $s0, $t9
mfhi $s1			# Remainder
mflo $s2			# Quotient

sw $s1, 0($s7)
addi $s7, $s7, 4 
addi $t2, $t2, 1 

add $s0, $s2, $zero

slti $t0, $s0, 2
beq $t0, $zero, Loop

sw $s0, 0($s7)
addi $t2, $t2, 1		# Number of Array elements 
EndLoop:

la $a0, Msg2
add $v0, $zero, 4
syscall

ArrayLoop:
lw $t3, 0($s7)
add $a0, $t3, $zero
add $v0, $zero, 1
syscall

addi $s7, $s7, -4 
addi $t2, $t2, -1
bne $t2, $zero, ArrayLoop
EndArrayLoop:

add $v0, $zero, 10
syscall
