package com.ht.common;

import org.junit.Test;

public class EncryptUtilTest {

    @Test
    public void testEncrypt() {
        System.out.println(EncryptUtil.md5("123@qq.com"));
    }
}
