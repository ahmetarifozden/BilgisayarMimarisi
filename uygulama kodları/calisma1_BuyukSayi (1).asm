.data
msgone: .asciiz "Enter The 1st Integer"
msgtwo: .asciiz "Enter whe 2nd Integer"
msgthree: .asciiz "The larger integer is:"
msgfour: .asciiz "The two numbers are equal"

.text
.globl main
main:

la $a0, msgone
addi $v0, $zero, 4
syscall

addi $v0, $zero, 5
syscall
add $t0, $v0, $zero

la $a0, msgtwo
addi $v0, $zero, 4
syscall

addi $v0, $zero, 5
syscall
add $t1, $v0, $zero

Equality:
sub $t3, $t0, $t1
beq $t3, $zero, equal

Compare:
slt $t2, $t1, $t0
bne $t2, $zero, max

la $a0, msgthree
addi $v0, $zero, 4
syscall

add $a0, $t1, $zero
addi $v0, $zero, 1
syscall

j exit

equal:
la $a0, msgfour
addi $v0, $zero, 4
syscall

j exit

max:
la $a0, msgthree
addi $v0, $zero, 4
syscall

add $a0, $t0, $zero
addi $v0, $zero, 1
syscall

exit:

addi $v0, $zero, 10
syscall
