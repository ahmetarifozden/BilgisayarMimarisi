.data 
msg1: .asciiz "Küpün alanı:"
msg2: .asciiz "kürenin alanı:"
msg3: .asciiz "silindirin alanı:"
AlanDizisi: .space 40
counter:    .word   1       
max_value:  .word   10

.text 
.globl main
main:

loop_start:
lw  $t8, counter     # counter değerini yükle
lw  $t9, max_value   # max_value değerini yükle
bge $t8, $t9, loop_end

add $t4, $zero, 3
add $t5, $zero, 2
add $t6, $zero, 1


addi $v0, $zero, 5 
syscall 
add $t0, $v0, $zero 

beq $t0, $t4, küp
j karsilastirma

küp:
addi $v0, $zero, 5 
syscall 
add $t0, $v0, $zero 

add $t3, $zero, 6
mul $t2, $t3, $t0
mul $t2, $t2, $t0

la $a0, msg1
addi $v0, $zero, 4
syscall
add $a0, $t2, $zero
addi $v0,$zero,1
syscall

karsilastirma:

beq $t0, $t5, küre
j silindir

küre:
add $s1,$zero,4
add $s2,$zero,3
mul $s2,$s2,$s1
addi $v0, $zero, 5 
syscall 
add $t0, $v0, $zero 

mul $s2,$s2,$t0
mul $s3,$s2,$t0

la $a0, msg2
addi $v0, $zero, 4
syscall
add $a0, $s3, $zero
addi $v0,$zero,1
syscall

silindir:

add $s2,$zero,3
add $s1,$zero,2
mul $s1,$s1,$s2

addi $v0, $zero, 5 
syscall 
add $t0, $v0, $zero 

addi $v0, $zero, 5 
syscall 
add $t1, $v0, $zero 

mul $a1,$s1,$t0
mul $a1,$a1,$t1

mul $a2,$s1,$t0
mul $a2,$a2,$t0

add $s6,$a1,$a2


la $a0, msg3
addi $v0, $zero, 4
syscall
add $a0, $s6, $zero
addi $v0,$zero,1
syscall

add $t8, $zero, 1
sw   $t8, counter

j loop_start 

loop_end:
li  $v0, 10       # Programı sonlandır
syscall
