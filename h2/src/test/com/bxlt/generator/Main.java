package com.bxlt.generator;

import com.bxlt.generator.code.CodeGenerator;
import javafx.scene.control.Tab;
import org.h2.command.Command;
import org.h2.command.CommandContainer;
import org.h2.command.Parser;
import org.h2.store.DataReader;
import org.h2.test.TestBase;

import java.io.*;
import java.nio.CharBuffer;
import java.sql.Connection;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wangjw on 2016/6/27.
 * genju
 */
public class Main extends TestBase {

    public static void main(String[] args) throws Exception {
        new Main().test();
    }

    @Override
    public void test() throws Exception {
        String ddlFile = "D:\\javaout\\DDL.sql";
        String ddl = FileUtils.readUTF8FileToString(new File(ddlFile));
        SqlParser parser = new SqlParser(ddl);
        SqlParser parser1 = new SqlParser(ddl);
        HashMap<String,Table> p = parser.parse(ddl);
        HashMap<String,List<Comment>> c = parser1.parseComment(ddl);
        addComment(p,c);
        CodeGenerator generator  = new CodeGenerator();
        generator.generate(p);
    }


    private  void addComment(HashMap<String,Table> tables, HashMap<String,List<Comment>> list)
    {
        for(Map.Entry<String,List<Comment>> entry : list.entrySet())
        {
            List<Comment> cms =  entry.getValue();
            Table t  = tables.get(entry.getKey());
            for(Comment c :cms)
            {
                t.getColumn(c.getName()).setComment(c.getComment());
            }
        }
    }
}
