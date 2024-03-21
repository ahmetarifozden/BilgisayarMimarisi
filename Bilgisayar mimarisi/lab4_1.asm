.data
.align 2

source_array:   .word 2, 0, -4, 16, 0, -1, -8, -10, 0, -2, -3, 11 
target_array:   .space 100   # Hedef diziyi oluştur (6 eleman * 4 byte/eleman)

.text
.globl main
main:
    # Kaynak dizisinin adresini yükle
    la $t0, source_array

    # Hedef dizisinin adresini yükle
    la $t1, target_array

    # Eleman sayısı (örneğin 6 elemanlı bir dizi)
    li $t2, 12

loop:
    # Kaynak dizisinin bir elemanını yükle
    lw $t3, 0($t0)

    # Eğer eleman 0'dan küçükse yazdır
    slt $t4, $zero, $t3    # 0 < $t3 ise $t4=1, değilse $t4=0
    beq $t4, $zero, print_eleman  # $t4=0 ise print_eleman'a git 
    j next_eleman  
    
print_eleman:

    beq $t3, $zero, next_eleman 
    add $a0,$t3,$zero     # Yazdırılacak elemanı $a0'ye yükle 
    addi $v0,$zero,1          # Integer yazdır
    syscall
    
    sw $t3, 0($t1)     # target_array dizisine yazdır 
    addi $t1, $t1, 4   # dizinin bir sonraki elemanına yazdırmak için bir arttır. 
    
next_eleman:
    # Kaynak dizide bir sonraki elemana geç
    addi $t0, $t0, 4

    # Eleman sayısını azalt
    addi $t2, $t2, -1

    # Eğer elemanlar bitmediyse döngüye devam et
    bnez $t2, loop

    # Program sonu
    addi $v0, $zero, 10 
    syscall 
