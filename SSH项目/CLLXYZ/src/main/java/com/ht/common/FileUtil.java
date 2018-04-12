package com.ht.common;

import org.apache.struts2.ServletActionContext;

import java.io.File;

public class FileUtil {
    public static String PATH="public/images/upload";
    public static String upload(){
        String rootPath = ServletActionContext.getServletContext().getRealPath("/");
        File uploads = new File(rootPath,PATH);
        if (!uploads.exists()){
            uploads.mkdirs();
        }
        return uploads.getAbsolutePath();
    }
}
