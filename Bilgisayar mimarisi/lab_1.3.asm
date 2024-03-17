.data 
msg1: .asciiz "Toplam: "

.text 
.globl main 
main: 
addi $v0, $zero, 5
syscall 
add $t0, $v0, $zero 

 
add $t2, $zero, 9
add $t3, $zero, 5
#add $t5, $zero, 32

mul $t4, $t2, $t0   
div $t5, $t4, $t3




add $t6, $t5, 32


la $a0, msg1 
addi $v0, $zero, 4
syscall 

add $a0, $t6, $zero 
addi $v0, $zero, 1
syscall 



addi $v0, $zero, 10 
syscall