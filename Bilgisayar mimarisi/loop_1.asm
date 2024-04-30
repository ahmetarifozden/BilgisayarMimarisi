.data
msg: .asciiz "Tam sayı giriş"
.text
.globl main
main:
la $a0,msg
addi $v0,$zero,4
syscall
addi $t0,$zero,145
mtc1 $t0,$f1
cvt.s.w $f1,$f1
addi $t0,$zero,-12
mtc1 $t0,$f2
cvt.s.w $f2,$f2
addi $v0,$zero,10
 syscall