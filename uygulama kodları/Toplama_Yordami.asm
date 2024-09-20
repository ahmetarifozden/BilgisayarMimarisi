.data
Array:   .space 1000 
MsgOne: .asciiz "Enter The Number Of Array Components: "
MsgTwo: .asciiz "Enter One Of The Array Components: "
MsgThree: .asciiz "The array enrance is completed\n"
MsgFour: .asciiz "Enter the index values that the integers between these to be summed:\n"
MsgFive: .asciiz "The Sum Between The Entered Integers: "
.text
.globl main
#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------
main:
la $s7,Array

la $a0,MsgOne		#Number of integers n
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall

add $a0,$v0,$zero
add $a1,$s7,$zero
jal ProcedureArray

la $a0,MsgThree	#Integers are entered
addi $v0,$zero,4
syscall

la $a0,MsgFour		#Two Integer Entrance
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $s0,$v0,$zero

addi $v0,$zero,5
syscall
add $s1,$v0,$zero

add $a0,$s0,$zero
add $a1,$s1,$zero
add $a2,$s7,$zero
jal ProcedureSumBetween

add $s6,$v0,$zero

la $a0,MsgFive		#The Sum
addi $v0,$zero,4
syscall

add $a0,$s6,$zero
addi $v0,$zero,1
syscall

add $v0, $zero, 10
syscall
#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------
ProcedureArray:
addi $sp,$sp,-4
sw $s7,0($sp)

add $s0,$a1,$zero		#Base address of the array
sll $t0,$a0,2
add $t0,$t0,$s0

Loop:
la $a0,MsgTwo
addi $v0,$zero,4
syscall

addi $v0,$zero,5
syscall
add $t1,$v0,$zero

sw $t1,0($s0)
addi $s0,$s0,4

slt $t2,$s0,$t0
bne $t2,$zero,Loop
EndLoop:

lw $s7,0($sp)
addi ,$sp,$sp,4

jr $ra				#End of ProcedureArray
#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------
ProcedureSumBetween:
addi $sp,$sp,-12
sw $s7,8($sp)
sw $s1,4($sp)
sw $s0,0($sp)

Larger:
slt $t9,$a0,$a1
bne $t9,$zero,EndLarger

add $s0,$a1,$zero
add $s1,$a0,$zero
j Change
EndLarger:

add $s0,$a0,$zero
add $s1,$a1,$zero

Change:
sll $t0,$s1,2
add $t1,$a2,$t0
sll $t2,$s0,2
add $t3,$a2,$t2

add $t6,$zero,$zero
addi $t3,$t3,-4
Sum:
lw $t4,0($t3)
add $t6,$t6,$t4

addi $t3,$t3,4

slt $t5,$t3,$t1
bne $t5,$zero,Sum
EndSum:

add $v0,$t6,$zero

lw $s0,0($sp)
lw $s1,4($sp)
lw $s7,8($sp)
addi $sp,$sp,12

jr $ra				#End of ProcedureSumBetween
#---------------------------------------------------------------------------------------------------
#---------------------------------------------------------------------------------------------------
