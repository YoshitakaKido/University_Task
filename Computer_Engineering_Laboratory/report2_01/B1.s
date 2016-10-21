        .data                       # データセグメントにデータを配置することを示す
str:    .asciiz     "s153038\n"
        .text                       # 以下の記述をテキストセグメントに配置
        .align      2               # 4byte境界になるように調整する
        .globl      main
main:
        li          $v0, 4          # syscallで文字列を表示する為に即値4をv0レジスタにロード
        la          $a0, str        # strが示すアドレスをa0レジスタにロード
        syscall                     # 文字列を表示
        move        $v0, $0         # 返り値を$v0に設定
        j           $ra             # 呼び出し側に戻る
