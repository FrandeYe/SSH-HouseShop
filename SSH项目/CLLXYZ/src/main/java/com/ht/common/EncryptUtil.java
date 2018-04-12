package com.ht.common;

import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class EncryptUtil {

    public static String md5(String src) {
        try {
            MessageDigest md = MessageDigest.getInstance(Constants.DEFAULT_ENCRYPT);
            byte[] bytes = md.digest(src.getBytes(Constants.DEFAULT_ENCODING));
            BASE64Encoder encoder = new BASE64Encoder();
            return encoder.encode(bytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }
}
