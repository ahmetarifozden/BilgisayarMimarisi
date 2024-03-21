.data
.align 2
source_array:   .word 5, -3, 8, -2, 0, -7
target_array:   .space 24   # Hedef diziyi oluştur (6 eleman * 4 byte/eleman)

.text
.globl main
main:
    # Kaynak dizisinin adresini yükle
    la $t0, source_array

    # Hedef dizisinin adresini yükle
    la $t1, target_array

    # Eleman sayısı (örneğin 6 elemanlı bir dizi)
    li $t2, 6

loop:
    # Kaynak dizisinin bir elemanını yükle
    lw $t3, 0($t0)

    # Eğer eleman 0'dan küçükse yazdır
    slt $t4, $zero, $t3    # 0 < $t3 ise $t4=1, değilse $t4=0
    bne $t4, $zero, next_element  # $t4=0 ise next_element'e git
    
    add $a0,$t3,$zero
    addi $v0,$zero,1
    syscall

print_element:
    # Yazdırılacak elemanı $a0'ye yükle
    move $a0, $t3

    # Integer yazdır
    li $v0, 1
    syscall

next_element:
    # Kaynak dizide bir sonraki elemana geç
    addi $t0, $t0, 4

    # Eleman sayısını azalt
    addi $t2, $t2, -1

    # Eğer elemanlar bitmediyse döngüye devam et
    bnez $t2, loop

    # Program sonu
        li  $v0, 10          # Programı sonlandır
        syscall