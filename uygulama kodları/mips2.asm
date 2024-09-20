.data
prompt_weight: .asciiz "Lütfen kilonuzu giriniz (kg): "
prompt_height: .asciiz "Lütfen boyunuzu giriniz (m): "
result_msg: .asciiz "BMI: "
category_msg: .asciiz "Kategori: "
overweight_msg: .asciiz "fazla kilolu: "
underweight_msg: .asciiz "az kilolu: "
normal_msg: .asciiz "orta kilolu: "
sayi1: .float 18.5
sayi2: .float 25
.text
main:
    # Kilo bilgisi alınır
    li $v0, 4
    la $a0, prompt_weight
    syscall

    li $v0, 6
    syscall
    mov.s $f12, $f0

    # Boy bilgisi alınır
    li $v0, 4
    la $a0, prompt_height
    syscall
     
    li $v0, 6
    syscall
    mov.s $f14, $f0

    # Boyun karesi hesaplanır
    mul.s $f16, $f14, $f14

    # BMI hesaplanır: kilo / (boy^2)
    div.s $f18, $f12, $f16

    # BMI değerini yazdır
    li $v0, 4
    la $a0, result_msg
    syscall

    mov.s $f12, $f18
    li $v0, 2
    syscall

    # BMI değerine göre kategori belirleme
    li $v0, 4
    la $a0, category_msg
    syscall

    lwc1 $f7, sayi1
    
    mov.s  $f0, $f7       
    c.lt.s $f18, $f0    
    bc1t underweight   

    lwc1 $f8, sayi2
    
    mov.s $f0, $f8
    c.lt.s $f18, $f0
    bc1t normal

    # Fazla kilolu
    li $v0, 4
    la $a0, overweight_msg
    syscall
    j end

underweight:
    # Az kilolu
    li $v0, 4
    la $a0, underweight_msg
    syscall
    j end

normal:
    # Normal kilo
    li $v0, 4
    la $a0, normal_msg
    syscall

end:
    # Programı bitir
    addi $v0, $zero, 10 		
    syscall 	