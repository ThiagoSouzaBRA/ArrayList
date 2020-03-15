.data
a: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
b: .word 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26
c:.word
1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
x: .word 1
y: .word 1

la $s0,a
la $s1,b
la $s2,c

.text
if: bne $s3, $s4, L2
sub $t1,$s1,$s2 
sw 0($s0),$t1
lw $t0,4($s0)
add $t5,$t0,$s2 
sw $s1,$t5
lw $t4,8($s2)
add $t5,$s1,$t4 
sw $s2,$t5
j fim
L2: 
lw $t0,20($s0)
lw $t1,16($s0)
add $t2,$t1,$t0
sw 12($s0),$t2

for: beq $s0, $t0, fim
add $s1, $s1, $s0
addi $s0, $s0, 1
j for

while: beq $s0, $t0, fim
sll $s0, $s0, 1
addi $s1, $s1, 1
j while

bne $s3, $s4, L1
add $s0, $s1, $s2
j fim
L1: sub $s0, $s0, $s3
fim:
