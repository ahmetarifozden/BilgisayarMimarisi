# Sekil Kodlari
# Küp --> 1
# Küre --> 2
# Silindir --> 3
.data
AlanDizisi: .space 100	#25 eleman
msg1: .asciiz "\nSekil numarasini secin (Küp-1, Kure-2, Silindir-3): "
msg2: .asciiz "Küp icin a parametresini giriniz: "
msg3: .asciiz "Küre icin r parametresini giriniz: "
msg4: .asciiz "Silindir icin r parametresini giriniz: "
msg5: .asciiz "Silindir icin h parametresini giriniz: "
msg6: .asciiz "Alan: "
msg7: .asciiz "\nSeciminizi kontrol ediniz\n"
.text
.globl main 
main:
## Sekil kod numarasi
indisleme:
la $t9, AlanDizisi		# $t9 --> AlanDisizinin taban adresi (base address)
addi $t8, $zero, 0
addi $t7, $zero, 10

addi $t1, $zero, 1
addi $t2, $zero, 2
addi $t3, $zero, 3

sekilSec:
la $a0, msg1 			# msg1'in adresini $a0'a yukle 
addi $v0, $zero, 4 		# 4 karakter dizisi yazma sistem cagrisi
syscall 			# syscall yap

addi $v0, $zero, 5 		# tamsayi okuma, okunan sayi $v0'a alinir
syscall 			# syscall yap
add $s0, $v0, $zero 		# $s0 --> sekil numarasi 

kosul:
bne $s0, $t1, kure1 

la $a0, msg2 			# msg2'in adresini $a0'a yukle 
addi $v0, $zero, 4 		# 4 karakter dizisi yazma sistem cagrisi
syscall 			# syscall yap

addi $v0, $zero, 5 		# tamsayi okuma, okunan sayi $v0'a alinir
syscall 			# syscall yap
add $s1, $v0, $zero 		# $s1 --> a parametresi

mul $s7, $s1, $s1		# a * a
mul $s7, $s7, 6			# alan --> 6 * a * a
j kosulSonu

kure1:
bne $s0, $t2, silindir1 

la $a0, msg3 			# msg3'ün adresini $a0'a yukle 
addi $v0, $zero, 4 		# 4 karakter dizisi yazma sistem cagrisi
syscall 			# syscall yap

addi $v0, $zero, 5 		# tamsayi okuma, okunan sayi $v0'a alinir
syscall 			# syscall yap
add $s1, $v0, $zero 		# $s1 --> r parametresi

mul $s7, $s1, $s1		# r * r
mul $s7, $s7, 4			# 4 * r * r
mul $s7, $s7, 314		# 4 * r * r * 314
div $s7, $s7, 100		# 4 * r * r * 314/100
j kosulSonu

silindir1:
bne $s0, $t3, hata

la $a0, msg4 			# msg4'ün adresini $a0'a yukle 
addi $v0, $zero, 4 		# 4 karakter dizisi yazma sistem cagrisi
syscall 			# syscall yap

addi $v0, $zero, 5 		# tamsayi okuma, okunan sayi $v0'a alinir
syscall 			# syscall yap
add $s1, $v0, $zero 		# $s1 --> r parametresi

la $a0, msg5 			# msg5'in adresini $a0'a yukle 
addi $v0, $zero, 4 		# 4 karakter dizisi yazma sistem cagrisi
syscall 			# syscall yap

addi $v0, $zero, 5 		# tamsayi okuma, okunan sayi $v0'a alinir
syscall 			# syscall yap
add $s2, $v0, $zero 		# $s2 --> h parametresi

mul $s6, $s1, $s2		# r * h
mul $s6, $s6, 2			# 2 * r * h
mul $s6, $s6, 314		# 2 * r * h * 314
div $s6, $s6, 100		# 2 * r * h * 314/100

mul $s5, $s1, $s1		# r * r
mul $s5, $s5, 2			# 2 * r * r
mul $s5, $s5, 314		# 2 * r * r * 314
div $s5, $s5, 100		# 2 * r * r * 314/100

add $s7, $s6, $s5		# $s7 --> alan
kosulSonu:

sw $s7, 0($t9)
addi $t9, $t9, 4
addi $t8, $t8, 1
beq $t8, $t7, indislemeSonu

la $a0, msg6 			# msg6'n?n adresini $a0'a yukle 
addi $v0, $zero, 4 		# 4 karakter dizisi yazma sistem cagrisi
syscall 			# syscall yap

add $a0, $s7, $zero 		# konsola basilacak sayiyi $a0'a tasi
addi $v0, $zero, 1 		# tamsayi okuma, okunan sayi $v0'a alinir
syscall 			# syscall yap

j sekilSec

hata:
la $a0, msg7 			# msg6'n?n adresini $a0'a yukle 
addi $v0, $zero, 4 		# 4 karakter dizisi yazma sistem cagrisi
syscall 			# syscall yap

j sekilSec
indislemeSonu:

addi $v0, $zero, 10 		# cikis icin syscall kodu 1
syscall 			# syscall yap
# main programin sonu
