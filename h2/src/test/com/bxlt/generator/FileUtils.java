package com.bxlt.generator;

import java.io.*;

/**
 * Created by wangjw on 2016/6/30.
 */
public class FileUtils {

    public static  String readFileToString(File in,String encoding) throws IOException {
        FileInputStream fileIn = new FileInputStream(in);
        ByteArrayOutputStream out = new ByteArrayOutputStream(4096);
        copy(fileIn,out);
        return out.toString(encoding);
    }

    public  static String readUTF8FileToString(File in) throws IOException {
        return readFileToString(in,"UTF-8");
    }

    private static int copy(InputStream in,OutputStream out) throws IOException {
        byte[] bytes = new byte[1024];
        int n = 0;
        int byteRead = 0;
        while((n = in.read(bytes,0,1024))> 0)
        {
            out.write(bytes,0,n);
            byteRead += n;
        }
        return byteRead;
    }
}
