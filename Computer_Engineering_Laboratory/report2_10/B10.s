            .data
result:     .word	    0:40
str:        .asciiz	"\n"
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
print:
            sll	    $t5, $t3, 2         # レジスタ$t3の内容を２ビット左へ論理シフト
            lw	    $a0, result($t5)    # reslut[i]呼び出し
            li	    $v0, 1              # print_int出力
            syscall                     # 実行結果表示
            subu	$t3, $t3, 1         # i--
            bge	    $t3, $0, print      # i >= 0 ならばラベルprintへ
            la	    $a0, str            # asciizで保存したプリントする文字列のアドレスをレジスタ a0 に格納
            li	    $v0, 4              # print_string出力
            syscall                     # 改行表示
            j       $ra                 # 呼び出し側に戻る
