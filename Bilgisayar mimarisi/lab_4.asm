.data 
Dizi1: .word 2, 0, -4, 16, 0, 1, -8, -10, 0, 2, -3, 11
Dizi2: .space 24
counter:    .word   1       # Başlangıç değeri 1
max_value:  .word   12      # Bitiş değeri 12


.text 
.globl main
main:
    la $t0 , Dizi1
    la $t1, Dizi2
	
	 	
    # Döngü başlangıcı
loop_start:
        lw  $t9, counter     # counter değerini yükle
        lw  $t8, max_value   # max_value değerini yükle
        bge $t9, $t8, loop_end  # counter >= max_value ise döngüyü sonlandır
	
        lw $t3, 0($t0)

        slt $t4, $zero, $t3    # 0 < $t3 ise $t4=1, değilse $t4=0
        bne $t4, $zero, next_element  # $t4=0 ise next_element'e git
        j print_element 
        # Sayıyı ekrana yazdır
        #add $a0,$t3,$zero
        #addi $v0,$zero,1
        #syscall
print_element:
        # Yazdırılacak elemanı $a0'ye yükle
        move $a0, $t3
        # Integer yazdır
        li $v0, 1
        syscall
        addi $t9, $t9, 1
        sw   $t9, counter
        #j loop_start 
next_element:
        # Kaynak dizide bir sonraki elemana geç
        #addi $t0, $t0, 4
        #addi $t2, $t2, -1
               
        addi $t9, $t9, 1
        sw   $t9, counter

j loop_start 

        # Sayacı artır
        # Döngünün başına geri dön

        # Döngü sonu
loop_end:
        li  $v0, 10          # Programı sonlandır
        syscall

	
	
	 	
