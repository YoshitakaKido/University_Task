            .data
result:     .word	0:40
str:        .asciiz	"\n"
space:      .asciiz	" "
zero:       .asciiz "0"
            .text
            .align	2
            .globl	main
main:
            li      $t0, 0              # top = 0
            li	    $t5, 1              # レジスタ$t5に即値１をロード
            sw	    $t5, result($0)     # result[0] = 1
            li	    $t1, 2              # kake = 2
for_kake:
            li	    $t2, 0              # agari = 0
            li	    $t3, 0              # i = 0
for_i:
            sll	    $t6, $t3, 2         # レジスタ$t3の内容を２ビット左へ論理シフト
            lw	    $t5, result($t6)    # reslut[i]
            mult	$t5, $t1            # reslut[i] * kake
            mflo	$t4                 # t = result[i] * kake
            add	    $t4, $t4, $t2       # t = t + agari
            li	    $t5, 10000          # レジスタ$t5に即値10000をロード
            div	    $t4, $t5            # t / 10000
            mflo	$t2                 # agari = t / 10000
            mfhi	$t6                 # t % 10000
            sll	    $t7, $t3, 2         # レジスタ$t3の内容を２ビット左へ論理シフト
            sw	    $t6, result($t7)    # reslut[i] = t % 10000
            addi	$t3, $t3, 1         # i++
            ble	    $t3, $t0, for_i     # i <= topならばラベルfor_iへ
            ble	    $t2, $0, else       # agari <= 0ならばラベルelseへ
            addi	$t0, $t0, 1         # top++
            sll	    $t5, $t0, 2         # レジスタ$t0の内容を２ビット左へ論理シフト
            sw	    $t2, result($t5)    # result[top] = agari
else:
            addi	$t1, $t1, 1         # kake++
            li	    $t5, 100            # レジスタ$t5に即値100をロード
            ble	    $t1, $t5, for_kake  # kake <= 100ならばラベルfor_kakeへ
            move	$t3, $t0            # レジスタ$t3にレジスタ$t0の保持するアドレスを格納

            li      $t7, 10             # レジスタ$t7に即値10をロード(t = 10)

print:
            la      $a0, space          # spaceが指すアドレスをレジスタ$taに格納
            li      $v0, 4              # print_string出力
            syscall                     # 文字列" "を表示
            sll     $t6, $t3, 2         # レジスタ$t3の内容を２ビット左へ論理シフト
            lw      $t5, result($t6)    # result[i]
            li      $t6, 1000           # レジスタ$t6に即値1000をロード

            bgt	    $t5, $t6, else1     # $t5 > $t6 ならばラベルelse1へ
            la      $a0, zero           # asciizで保存したプリントする文字列のアドレスをレジス$a0に格納
            li	    $v0, 4              # print_string出力
            syscall                     # 文字列"0"を表示
else1:
            li	    $t6, 100            # レジスタ$t6に即値100をロード
            bgt	    $t5, $t6, else2     # $t5 > $t6 ならばラベルelse2へ
            la	    $a0, zero           # asciizで保存したプリントする文字列のアドレスをレジス$a0に格納
            li	    $v0, 4              # print_string出力
            syscall                     # 文字列"0"を表示
else2:
            li	    $t6, 10             # レジスタ$t6に即値10をロード
            bgt	    $t5, $t6, else3     # $t5 > $t6 ならばラベルelse3へ
            la	    $a0, zero           # asciizで保存したプリントする文字列のアドレスをレジス$a0に格納
            li	    $v0, 4              # print_string出力
            syscall                     # 文字列"0"を表示
else3:
            move	$a0, $t5            # レジスタ$a0にレジスタ$t5の保持するアドレスを格納
            li	    $v0, 1              # print_int出力
            syscall                     # レジスタ$t5の価を表示
            subu	$t3, $t3, 1         # i--

            subu    $t7, $t7, 1         # t--
            bne     $t7, $0, print      # t != 0 ならばラベルprintへ

            la	    $a0, str            # asciizで保存したプリントする文字列のアドレスをレジスタ $a0に格納
            li	    $v0, 4              # print_string出力
            syscall                     # 改行表示

            li      $t7, 10             # t = 10

            bge	    $t3, $0, print      # $t3 <= 0 ならばラベルprintへ
            j       $ra                 # 呼び出し側に戻る
