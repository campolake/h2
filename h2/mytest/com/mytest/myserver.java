package com.mytest;

import com.sun.org.apache.xpath.internal.operations.String;
import org.h2.tools.Server;

import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by wangjw on 2016/6/21.
 */
public class myserver {

    public static void main(String[] args) throws SQLException {
// System.setProperty("DATABASE_TO_UPPER", "false");
        System.setProperty("h2.lobInDatabase", "false");
        System.setProperty("h2.lobClientMaxSizeMemory", "1024");
        System.setProperty("java.io.tmpdir", "./target/mytest/tmp");
        System.setProperty("h2.baseDir", "./target/mytest");
        //System.setProperty("h2.check2", "true");
        ArrayList<java.lang.String> list = new ArrayList<java.lang.String>();
        // list.add("-tcp");
        // //list.add("-tool");
        // org.h2.tools.Server.main(list.toArray(new String[list.size()]));
        //
        //list.add("-tcp");
//		 list.add("-tcpPort");
//		 list.add("9092");

        // 测试org.h2.server.TcpServer.checkKeyAndGetDatabaseName(String)
        // list.add("-key");
        // list.add("mydb");
        // list.add("mydatabase");

        //list.add("-pg");
        list.add("-tcp");
//		list.add("9092");
        //list.add("-web");
        Server.main(list.toArray(new java.lang.String[list.size()]));
    }
}
