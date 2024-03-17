# Örnek: 1'den 10'a kadar olan sayıları ekrana yazdıran bir döngü

.data
    # Değişkenler
    counter:    .word   1       # Başlangıç değeri 1
    max_value:  .word   10      # Bitiş değeri 10

.text
    .globl main

main:
    # Döngü başlangıcı
    loop_start:
        lw  $t0, counter     # counter değerini yükle
        lw  $t1, max_value   # max_value değerini yükle
        bge $t0, $t1, loop_end  # counter >= max_value ise döngüyü sonlandır

        # Sayıyı ekrana yazdır
        li  $v0, 1           # System call: print integer
        move $a0, $t0        # Yazdırılacak sayı
        syscall

        # Sayacı artır
        addi $t0, $t0, 1
        sw   $t0, counter

        j loop_start         # Döngünün başına geri dön

    # Döngü sonu
    loop_end:
        li  $v0, 10          # Programı sonlandır
        syscall
