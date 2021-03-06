        .data                       # データセグメントにデータを配置することを示す

to_5:   .word   0, 0, 0, 0, 0
from_5: .word   1, 2, 3, 4, 5
        .word   6, 7, 8, 9, 10

from_6: .word   1, 2, 3, 4, 5
to_6:   .word   6, 7, 8, 9, 10
        .word   0, 0, 0, 0, 0

str:    .asciiz "\n"
msg:    .asciiz ":"
        .text                       # 以下の記述をテキストセグメントに配置
        .align  2                   # 4byte境界になるように調整する
        .globl  main
main:
        la        $t0, from_5       # from_5が指すアドレスをレジスタ$t0に格納
        la        $t1, to_5         # to_5が指すアドレスをレジスタ$t1に格納
        bgt       $t0, $t1, main5   # $t0 > $t1ならばラベルmain5へ
        bgt       $t1, $t0, main6   # $t1 > $t0ならばラベルmain6へ
main5:
        la        $t0, to_5         # toが指すアドレスをレジスタ t0 に格納
        la        $t1, from_5       # fromが指すアドレスをレジスタ t1 に格納
        la        $t2, to_5         # toが指すアドレスをレジスタ t2 に格納
        li        $t3, 15           # レジスタ t3 に即値15をロード
        li        $t4, 10           # レジスタ t4 に即値10をロード
        li        $t5, 15           # レジスタ t5 に即値15をロード
loop5_1:
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
        bne       $t3, $0, loop5_1  # レジスタ t3 の保持する値が 0 でなければラベル loop へ
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
loop5_2:
        lw        $t6, 0($t1)       # $t1 + 0のアドレスの内容をレジスタ t6 に格納
        sw        $t6, 0($t2)       # $t2 + 0 が示すメモリ番地にレジスタ t6 の内容を1ワードとして格納
        addu      $t1, $t1, 4       # レジスタ t1 の保持するアドレスに 4 を加えたものをレジスタ t1 に格納
        addu      $t2, $t2, 4       # レジスタ t2 の保持するアドレスに 4 を加えたものをレジスタ t2 に格納
        subu      $t4, $t4, 1       # レジスタ t4 の保持する値から 1 引いたものをレジスタ t4 に格納
        bne       $t4, $0, loop5_2  # レジスタ t4 の保持する値が 0 でなければラベル loo2 へ
        subu      $t2, $t2, 40      # レジスタ t2 の保持するアドレスから 40 を引いたものをレジスタ t2 に格納
loop5_3:
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
        bne       $t5, $0, loop5_3  # レジスタ t5 の保持する値が 0 でなければラベル loop3 へ
        li        $t0, 0            # レジスタ$t0に即値０を格納
        li        $t1, 2            # レジスタ$t1に即値２を格納
        addi      $t0, $t0, 1       # レジスタ$t0に１を加算
        bne       $t0, $t1, main6   # $t0 != $t1ならばラベルmain6へ
        j         $ra
main6:
        la        $t1, from_6       # fromが指すアドレスをレジスタ t1 に格納
        la        $t2, to_6         # toが指すアドレスをレジスタ t2 に格納
        bgt       $t1, $t2, main5   # $t1 > $t2ならばラベルmain5へ
        li        $t3, 15           # レジスタ $t3 に即値15をロード
        li        $t4, 10           # レジスタ $t4 に即値10をロード
        li        $t5, 15           # レジスタ $t5 に即値15をロード
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行表示
loop:
        move      $a0, $t1          # レジスタ a0 に レジスタ t1 の保持するアドレスを格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ to のアドレスを表示
        la        $a0, msg          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 文字列 ":" を表示
        lw        $a0, 0($t1)       # $t1 + 0のアドレスの内容をレジスタ a0 に格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ a0 の内容を表示
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
        addu      $t1, $t1, 4       # レジスタ t1 の保持するアドレスに 4 を加えたものをレジスタ t1 に格納
        subu      $t3, $t3, 1       # レジスタ t3 の保持する値から 1 を引いたものをレジスタ t3 に格納
        bne       $t3, $0, loop     # レジスタ t3 の保持する値が 0 でなければラベル loop へ
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
        addi      $t1, $t1, -24     # レジスタ $t1 の保持するアドレスに -24 を加えたものをレジスタ $t1 に格納
        addu      $t2, $t2, 36      # レジスタ $t2 の保持するアドレスに 36 を加えたものをレジスタ $t2 に格納
loop2:
        lw        $t0, 0($t1)       # $t1 + 0のアドレスの内容をレジスタ t6 に格納
        sw        $t0, 0($t2)       # $t2 + 0 が示すメモリ番地にレジスタ t6 の内容を1ワードとして格納
        addi      $t1, $t1, -4      # レジスタ $t1 の保持するアドレスから 4 を引いたものをレジスタ $t1 に格納
        addi      $t2, $t2, -4      # レジスタ $t2 の保持するアドレスから 4 を引いたものをレジスタ $t2 に格納
        subu      $t4, $t4, 1       # レジスタ $t4 の保持する値から 1 引いたものをレジスタ $t4 に格納
        bne       $t4, $0, loop2    # レジスタ $t4 の保持する値が 0 でなければラベル loo2 へ
        addi      $t1, $t1, 4       # レジスタ $t1 の保持するアドレスに 4 を加えたものをレジスタ $t1 に格納
loop3:
        move      $a0, $t1          # レジスタ a0 にレジスタ $t2 の保持するアドレスを格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ t2 の保持するアドレスを表示
        la        $a0, msg          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 文字列 ":" を表示
        lw        $a0, 0($t1)       # $t2 + 0のアドレスの内容をレジスタ a0 に格納
        li        $v0, 1            # print_intのシステムコールコードは 1
        syscall                     # レジスタ a0 の内容を表示
        la        $a0, str          # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
        li        $v0, 4            # print_stringのシステムコールコードは 4
        syscall                     # 改行処理
        addu      $t1, $t1, 4       # レジスタ t2 の保持するアドレスに 4 を加えたものをレジスタ t2 に格納
        subu      $t5, $t5, 1       # レジスタ t5 の保持する値から 1 を引いたものをレジスタ t5 に格納
        bne       $t5, $0, loop3    # レジスタ t5 の保持する値が 0 でなければラベル loop3 へ
        j         $ra               # jump to $ra
