.data 
msg1: .asciiz "sonuc: "

.text 
.globl main 
main: 
addi $v0, $zero, 5
syscall 
add $t0, $v0, $zero 

 
add $t1, $zero, 9
add $t2, $zero, 5
add $t5, $zero, 32

mul $t3, $t0, $t1
div $t4, $t3, $t2 
 
add $t6, $t4, $t5

la $a0, msg1 
addi $v0, $zero, 4
syscall 

add $a0, $zero, $t6 
addi $v0, $zero, 1
syscall 

addi $v0, $zero, 10 
syscall