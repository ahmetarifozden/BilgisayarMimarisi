.data

message1: .asciiz "birinci sayiyi giriniz"
message2: .asciiz "ikinci sayiyi giriniz"
message3: .asciiz "sayilar birbirine esit"
message4: .asciiz "ilk sayi buyuk:  "
message5: .asciiz "ikinci sayi buyuk:  "
.text

main:

addi $v0, $zero, 5
syscall
add $t1, $v0, $zero




addi $v0, $zero, 5
syscall
add $t2, $v0, $zero

beq $t1, $t2, esit
j karsilastirma



esit:

la $a0, message3
addi $v0, $zero, 4
syscall
addi $v0, $zero, 10
syscall
 
karsilastirma:
slt $t0, $t1, $t2  
beq $t0, $zero, birinci
j ikinci

birinci:

la $a0, message4
addi $v0, $zero, 4
syscall
add $a0, $t1, $zero
addi $v0,$zero,1
syscall

addi $v0, $zero, 10
syscall

ikinci:
la $a0, message5
addi $v0, $zero, 4
syscall
add $a0, $t2, $zero
addi $v0,$zero,1
syscall

addi $v0,$zero,10
syscall