package com.utils;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * 生成随机图片的工具类
 */
public class CheckImageUtil {

    //生成的随机验证码图片的宽度
    private static int IMAGE_WIDTH = 63;

    //生成的随机验证码图片的高度
    private static int Image_height = 37;

    /**
     * 生成随机颜色
     *
     * @param fc
     * @param bc
     * @return
     */
    public static Color getRandColor(int fc, int bc) {

        Random random = new Random();

        if (fc > 255) {
            fc = 255;
        }
        if (bc > 255) {
            bc = 255;
        }

        int r = fc + random.nextInt(bc - fc);
        int g = fc + random.nextInt(bc - fc);
        int b = fc + random.nextInt(bc - fc);

        return new Color(r, g, b);
    }
}