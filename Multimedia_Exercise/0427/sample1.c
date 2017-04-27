#include<stdio.h>
#include"pgm.h"


int main(void)
{
    /* 画像 No,0にファイルから画像を読み込む*/
    load_image(0, "");

    /* 画像No.0の画像をファイルに出力する */
    save_image(0, "");

    return 0;
}
