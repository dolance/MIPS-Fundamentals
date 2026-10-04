.data
fizz: .asciiz "Fizz"
buzz: .asciiz "Buzz"
fizzbuzz: .asciiz "FizzBuzz"

.text


li $t1, 1
li $t2, 101
loop1:
j PrintItem
PrintItemEnd:
j PrintNewLine
PrintNewLineEnd:
addi $t1, $t1, 1
bne $t1, $t2, loop1
j Exit


PrintItem:
# If divisible by 15
rem $t4, $t1, 15
beq $t4, $zero, PrintFizzBuzz

# If divisible by 3
rem $t4, $t1, 3
beq $t4, $zero, PrintFizz

# If divisible by 5
rem $t4, $t1, 5
beq $t4, $zero, PrintBuzz

# Otherwise
j PrintInt
PrintIntEnd:
j PrintItemEnd

PrintInt:
li $v0, 1
move $a0, $t1
syscall
j PrintIntEnd

#Print Fizz
PrintFizz: 
li $v0 4
la $a0, fizz
syscall
j PrintItemEnd

#Print Buzz
PrintBuzz:
li $v0, 4
la $a0, buzz
syscall
j PrintIntEnd

#Print FizzBuzz
PrintFizzBuzz:
li $v0, 4
la, $a0, fizzbuzz
syscall
j PrintIntEnd

PrintNewLine:
li $a0, '\n'
li $v0, 11
syscall
j PrintNewLineEnd
Exit: