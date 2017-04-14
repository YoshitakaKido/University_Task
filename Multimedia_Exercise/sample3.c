#include<stdio.h>
#include"pgm.h"

/* 画像 No.1 を左右反転っせて画像 No.2へ */
void lr_reverse(int n1, int n2);


int main(void)
{
    /* ファイル → 画像No.0 */
    load_image(0, "");

    /* No.0 を左右反転して No.1へ */
    lr_reverse(0, 1);

    /* 画像 No.1 → ファイル */
    save_image(1, "");

    return 0;
}

/* 画像 No.n1を左右反転させて画像 No.n2へ */
void lr_reverse(int n1, int n2)
{
    int x, y;


    width[n2] = width[n1];
    height[n2] = height[n1];

    /* 左右反転 */
    for (y = 0; y < height[n1]; y++)
    {
        for(x = 0; x < width[n1]; x++)
            image[n2][x][y] = image[n1][width[n1]-1-x][y];
    }
}
