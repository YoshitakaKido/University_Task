        .data
to:     .word   0, 0, 0, 0, 0
from:   .word   1, 2, 3, 4, 5
        .word   6, 7, 8, 9, 10
str:    .asciiz "\n"
msg:    .asciiz ":"
        .text
        .align  2
        .globl  main
main:
        la        $t0, to
        la        $t1, from
        la        $t2, to
        li        $t3, 15       # レジスタ t3 に即値15をロード
        li        $t4, 10
        li        $t5, 15
loop:
        move      $a0, $t0
        li        $v0, 1
        syscall
        la        $a0, msg
        li        $v0, 4
        syscall
        lw        $a0, 0($t0)
        li        $v0, 1
        syscall
        la        $a0, str
        li        $v0, 4
        syscall
        addu      $t0, $t0, 4
        subu      $t3, $t3, 1
        bne       $t3, $0, loop
        la        $a0, str
        li        $v0, 4
        syscall
loop2:
        lw        $t6, 0($t1)
        sw        $t6, 0($t2)
        addu      $t1, $t1, 4
        addu      $t2, $t2, 4
        subu      $t4, $t4, 1
        bne       $t4, $0, loop2
        subu      $t2, $t2, 40
loop3:
        move      $a0, $t2
        li        $v0, 1
        syscall
        la        $a0, msg
        li        $v0, 4
        syscall
        lw        $a0, 0($t2)
        li        $v0, 1
        syscall
        la        $a0, str
        li        $v0, 4
        syscall
        addu      $t2, $t2, 4
        subu      $t5, $t5, 1
        bne       $t5, $0, loop3
        j         $ra
