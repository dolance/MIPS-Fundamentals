li $t1, 2
li $t2, 102
li $t3, 0 

loop1:

add $t3, $t3, $t1
addi $t1, $t1, 2
bne $t1, $t2, loop1

# Print Sum
li $v0, 1	
move $a0, $t3
syscall
