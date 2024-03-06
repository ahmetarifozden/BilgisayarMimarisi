.data
msg1: .asciiz "Toplam: "
.text
.globl main
main:
## Kullanıcıdan ilk sayıyı al, $t0’ a yaz
addi $v0, $zero, 5 # syscall ile $v0’a sayıyı al
syscall # syscall
add $t0, $v0, $zero # okunan sayıyı $t0’a geçir
## Kullanıcıdan ilk sayıyı al, $t1’ e yaz
addi $v0, $zero, 5 # syscall ile $v0’a sayıyı al
syscall # syscall
add $t1, $v0, $zero # okunan sayıyı $t1’e geçir	

add $t2, $t0, $t1 # toplamı hesapla.
## $t2’ yi ekrana bas
la $a0, msg1 # msg1’nin başlangıç adresini $a0’a yükle
addi $v0, $zero, 4 # karakter dizisi yazma için syscall 4
syscall # syscall
add $a0, $t2, $zero # ekrana basılacak sayıyı $a0’ a geçir
addi $v0, $zero, 1 # tamsayı yazma için $v0’a syscall yükle
syscall # syscall
addi $v0, $zero, 10 # çıkış için syscall kodu 10’dur
syscall # syscall
# main programın sonu
