        .data
str:    .asciiz "\n"
msg:    .asciiz ">"
        .text
        .align  2
        .globl  main
main:
        addi    $t0, $0, 0      #$t0 = 0を代入

loop:
        li      $v0, 4
        la      $a0, msg
        syscall

        li      $v0, 5          #整数入力システムコールの番号５を設定
        syscall                 #入力された整数が$v0に入る

        slt     $t0, $v0, $t0   #入力された数($v0)が0より小さいか　小さい：$t0 = 1, 大きい：$t0 = 0
        bne     $t0, $0, done   #入力された数が0より小さい場合は終了 $t0 = 1ならdone

        move    $a0, $v0        #その整数をシステムコールの引数にする
        li      $v0, 1          #整数表示システムコールの番号1を設定
        syscall                 #入力された整数が画面に表示される

        li      $v0, 4          #改行処理
        la      $a0, str
        syscall

        j       loop            # jump to loop

done:
        move    $v0, $0
        j       $ra             # jump to $ra
