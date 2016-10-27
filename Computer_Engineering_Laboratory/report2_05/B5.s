        .data                       # データセグメントにデータを配置することを示す
to:     .word   0, 0, 0, 0, 0
from:   .word   1, 2, 3, 4, 5
        .word   6, 7, 8, 9, 10
str:    .asciiz "\n"
msg:    .asciiz ":"
        .text                       # 以下の記述をテキストセグメントに配置
        .align  2                   # 4byte境界になるように調整する
        .globl  main
main:
        la        $t0, to           # toが指すアドレスをレジスタ t0 に格納
        la        $t1, from         # fromが指すアドレスをレジスタ t1 に格納
        la        $t2, to           # toが指すアドレスをレジスタ t2 に格納
        li        $t3, 15           # レジスタ t3 に即値15をロード
        li        $t4, 10           # レジスタ t4 に即値10をロード
        li        $t5, 15           # レジスタ t5 に即値15をロード
loop:
        move      $a0, $t0          # レジスタ a0 に レジスタ t0 の保持するアドレスを格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ to のアドレスを表示
        la        $a0, msg          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 文字列 ":" を表示
        lw        $a0, 0($t0)       # $t0 + 0のアドレスの内容をレジスタ a0 に格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ a0 の内容を表示
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
        addu      $t0, $t0, 4       # レジスタ t0 の保持するアドレスに 4 を加えたものをレジスタ t0 に格納
        subu      $t3, $t3, 1       # レジスタ t3 の保持する値から 1 を引いたものをレジスタ t3 に格納
        bne       $t3, $0, loop     # レジスタ t3 の保持する値が 0 でなければラベル loop へ
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
loop2:
        lw        $t6, 0($t1)       # $t1 + 0のアドレスの内容をレジスタ t6 に格納
        sw        $t6, 0($t2)       # $t2 + 0 が示すメモリ番地にレジスタ t6 の内容を1ワードとして格納
        addu      $t1, $t1, 4       # レジスタ t1 の保持するアドレスに 4 を加えたものをレジスタ t1 に格納
        addu      $t2, $t2, 4       # レジスタ t2 の保持するアドレスに 4 を加えたものをレジスタ t2 に格納
        subu      $t4, $t4, 1       # レジスタ t4 の保持する値から 1 引いたものをレジスタ t4 に格納
        bne       $t4, $0, loop2    # レジスタ t4 の保持する値が 0 でなければラベル loo2 へ
        subu      $t2, $t2, 40      # レジスタ t2 の保持するアドレスから 40 を引いたものをレジスタ t2 に格納
loop3:
        move      $a0, $t2          # レジスタ a0 にレジスタ t2 の保持するアドレスを格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ t2 の保持するアドレスを表示
        la        $a0, msg          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 文字列 ":" を表示
        lw        $a0, 0($t2)       # $t2 + 0のアドレスの内容をレジスタ a0 に格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ a0 の内容を表示
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
        addu      $t2, $t2, 4       # レジスタ t2 の保持するアドレスに 4 を加えたものをレジスタ t2 に格納
        subu      $t5, $t5, 1       # レジスタ t5 の保持する値から 1 を引いたものをレジスタ t5 に格納
        bne       $t5, $0, loop3    # レジスタ t5 の保持する値が 0 でなければラベル loop3 へ
        j         $ra               # jump to $ra
