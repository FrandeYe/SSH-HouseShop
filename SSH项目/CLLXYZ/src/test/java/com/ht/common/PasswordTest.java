package com.ht.common;

import org.junit.Test;

/**
 * Created by Administrator on 2017/9/12.
 */
public class PasswordTest {
    @Test
    public void changePwd(){
        System.out.println(EncryptUtil.md5("123456"));
    }
}
