.align 2

.data
    prompt_num_elements: .asciiz "Dizi eleman sayisini girin: "
    prompt_element: .asciiz "Dizi elemanini girin: "
    prompt_index1: .asciiz "Ilk indisi girin: "
    prompt_index2: .asciiz "Ikinci indisi girin: "
    result_msg: .asciiz "Toplam: "
    array: .space 400    # Max 100 elemanlık yer ayırıyoruz (her biri 4 byte)
.text
.globl main

main:
    # Dizi eleman sayisini al
    la $a0, prompt_num_elements
    addi $v0, $zero, 4
    syscall

    li $v0, 5
    syscall
    move $t0, $v0          # $t0'ya dizi eleman sayisini koy

    # Dizi elemanlarini al
    la $s7, array          # Dizinin baslangic adresi
    move $a1, $t0          # Eleman sayisi
    jal read_array         # Dizi elemanlarini oku

    # İlk indisi al
    li $v0, 4
    la $s7, prompt_index1
    syscall

    li $v0, 5
    syscall
    move $t1, $v0          # $t1'e ilk indisi koy

    # İkinci indisi al
    li $v0, 4
    la $s7, prompt_index2
    syscall

    li $v0, 5
    syscall
    move $t2, $v0          # $t2'ye ikinci indisi koy

    # Toplamı hesapla
    la $s7, array          # Dizinin baslangic adresi
    move $a1, $t1          # İlk indis
    move $a2, $t2          # İkinci indis
    jal sum_array_elements # Alt yordamı çağır

    # Toplam sonucu yazdır
    li $v0, 4
    la $s7, result_msg
    syscall

    move $s7, $v0
    li $v0, 1
    syscall

    # Programı bitir
    li $v0, 10
    syscall

# Dizi elemanlarını okuyan alt yordam
read_array:
    # Giriş parametreleri:
    # $s7: Dizinin baslangic adresi
    # $a1: Dizinin eleman sayisi

    addi $t3, $zero, 0  # Döngü sayacı
read_array_loop:
    bge $t3, $a1, read_array_end  # Eğer $t3 >= $a1 ise döngüyü bitir

    # Dizi elemanını kullanıcıdan al
    li $v0, 4
    la $s7, prompt_element
    syscall

    li $v0, 5
    syscall

    # Elemanı diziye kaydet
    sll $t4, $t3, 2       # $t3 * 4 (çünkü her eleman 4 byte)
    add $t5, $s7, $t4     # Dizi adresi + offset
    sw $s5, 0($t5)        # Dizi elemanını kaydet

    addi $t3, $t3, 1      # Döngü sayacını artır
    j read_array_loop

read_array_end:
    jr $ra

# İndisler arasındaki elemanları toplayan alt yordam
sum_array_elements:
    # Giriş parametreleri:
    # $s7: Dizinin baslangic adresi
    # $a1: İlk indis
    # $a2: İkinci indis

    add $t3, $a1, $zero   # İlk indisi $t3'e koy
    add $t4, $a2, $zero   # İkinci indisi $t4'e koy
    addi $t5, $zero, 0    # Toplamı saklamak için $t5'i sıfırla

sum_array_loop:
    bgt $t3, $t4, sum_array_end  # Eğer $t3 > $t4 ise döngüyü bitir

    sll $t6, $t3, 2       # $t3 * 4 (çünkü her eleman 4 byte)
    add $t7, $s7, $t6     # Dizi adresi + offset
    lw $t8, 0($t7)        # Dizi elemanını oku
    add $t5, $t5, $t8     # Toplama ekle

    addi $t3, $t3, 1      # Döngü sayacını artır
    j sum_array_loop

sum_array_end:
    move $v0, $t5         # Toplamı $v0'a koy
    jr $ra
