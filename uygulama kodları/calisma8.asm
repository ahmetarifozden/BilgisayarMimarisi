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
    li $v0, 4
    la $s6, prompt_num_elements
    
    li $v0, 10
    syscall