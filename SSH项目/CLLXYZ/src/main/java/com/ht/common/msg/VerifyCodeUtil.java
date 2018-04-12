package com.ht.common.msg;

import java.util.Random;

public class VerifyCodeUtil {

    public static String getVerifyCode() {
        Random random = new Random();
        String str = "";
        for (int i = 0; i < 6; i++) {
            str += random.nextInt(9) + 1;
        }
        return str;
    }
}
