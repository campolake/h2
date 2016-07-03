package com.bxlt.generator.code;

import com.bxlt.generator.Table;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by wangjw on 2016/7/1.
 */
public class CodeGenerator {

    private  String filePath = "D:\\javaout\\";
    CodeNameContext context;



    private String getFileName(String fileName)
    {
        StringBuilder str  = new StringBuilder();
        String[] args = fileName.split("_");
        for(String s : args)
        {
            str.append(s.substring(0,1).toUpperCase() + s.substring(1).toLowerCase()).append("_");
        }
        return str.deleteCharAt(str.length()-1).toString();

    }

    public  void generate(HashMap<String,Table> tabs) throws IOException {
        for(Map.Entry<String,Table> t : tabs.entrySet())
        {
            String entityFilePath  = filePath + "entity\\";
            File entityFile = new File(entityFilePath);
            entityFile.mkdir();
            Table tab = t.getValue();
            CodeNameContext context  = new CodeNameContext(tab,filePath);
            EntityCode entityCode = new EntityCode(context);
            entityCode.generate();
            RepositoryCode repoCode  = new RepositoryCode(context);
            repoCode.generate();
            RepositoryCustomCode customCode  = new RepositoryCustomCode(context);
            customCode.generate();
            RepositoryImplCode implCode = new RepositoryImplCode(context);
            implCode.generate();
            ServiceCode serviceCode = new ServiceCode(context);
            serviceCode.generate();
        }

    }
}
