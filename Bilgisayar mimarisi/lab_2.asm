.data 
msg1: .asciiz "Farklı sayılar"
msg2: .asciiz "Sayılar eşittir"
.text 
.globl main
main:
addi $v0, $zero, 5 # syscall ile $v0’a sayıyı al
syscall # syscall
add $t0, $v0, $zero # okunan sayıyı $t0’a geçir

addi $v0, $zero, 5 # syscall ile $v0’a sayıyı al
syscall # syscall
add $t1, $v0, $zero # okunan sayıyı $t1’e geçir	


bne 