.data
.align 2
Dizi:		.space 400
DiziBoyut: 	.word  100
Msg:		.asciiz "Dizi uzunlugu: "

.text		
.globl main 
main:	
	lw $a1,DiziBoyut
	la $a0,Dizi			# a0 diziyi gosterir
	addi $v0,$zero,8
	syscall
						
	add $t2,$a0,$zero		# t2 diziyi gosterir
	add $t1,$zero,$zero		# t1 sayaci tutar
	addi $t3,$zero,10
DonguDizi:	
		lb $t0,0($t2)			# diziden bir byte alma
		beq $t0,$zero,DonguDiziSon	# sifir dizi sonunu gosterir
		beq $t0,$t3,Isaretci		# yeni satiri kaldir (linefeed)
		addi $t1,$t1,1			# sayaci arttir
Isaretci:	addi $t2,$t2,1			# isaretciyi bir karakter ilerlet 
		j DonguDizi			# dongu basina donme
DonguDiziSon:
	
		la $a0,Msg			# print icin sistem cagrisi 
		add,$v0,$zero,4			# mesaj
		syscall

	add $a0,$t1,$zero			# print icin sistem cagrisi 
	add, $v0,$zero,1			# uzunluk
	syscall		

	add, $v0,$zero,10
	syscall					# son :) ...
