package com.ht.common;

import org.junit.Test;

import java.util.UUID;

public class UUIDTest {

    @Test
    public void testUUID() {
        for (int i = 0; i < 100; i++) {
            UUID uuid = UUID.randomUUID();
            System.out.println(uuid.toString().replaceAll("-", ""));
        }
    }
}
