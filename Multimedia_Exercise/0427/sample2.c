#include<stdio.h>
#include"pgm.h"

/* 画像 No.nをshiftだけ明るくする */
void brighten(int n, int shift);


int main(void)
{
    /* ファイル　→　画像No.0 */
    load_image(0, "");

    /* 画像No.0の明るさを100上げる */
    brighten(0, 100);

    /* 画像No.0 → ファイル */
    save_image(0, "");

    return 0;
}

/* 画像 No.nをshiftだけ明るくする */
void brighten(int n, int shift)
{
    int x, y, brightness;


    for(y = 0; y < height[n]; y++)
    {
        for(x = 0; x < width[n]; x++)
        {
            brightness = image[n][x][y] + shift;
            if(brightness > 255)
                brightness = 255;
            image[n][x][y] = brightness;
        }
    }
}
