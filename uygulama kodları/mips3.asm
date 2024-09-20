.data
prompt_weight: .asciiz "Lütfen kilonuzu giriniz (kg): "
prompt_height: .asciiz "Lütfen boyunuzu giriniz (m): "
result_msg: .asciiz "BMI: "
category_msg: .asciiz "Kategori: "
overweight_msg: .asciiz "Fazla kilolu"
underweight_msg: .asciiz "Fazla kilolu"
normal_msg: .asciiz "Fazla kilolu"

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

    addi $t0, $zero, 185
    cvt.s.w $f0, $t0
    c.lt.s $f18, $f0
    bc1t underweight
    
    l.s $f0, 250
    cvt.s.w $f0, $f0
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