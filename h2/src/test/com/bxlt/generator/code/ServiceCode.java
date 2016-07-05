package com.bxlt.generator.code;

import com.bxlt.generator.Column;
import com.bxlt.generator.Table;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

/**
 * Created by wangjw on 2016/7/1.
 */
public class ServiceCode extends Code {

    public ServiceCode(CodeNameContext context) throws IOException {
        super(context);
        initWriter(context.getServicePath() + "\\" + context.getServiceName() + ".java");
        setPackageName(context.getServiceNamespace());
        addImport("com.aims.entity." + context.getEntityClassName());
    }


    @Override
    public void generate() throws IOException {
        println("package " + packageName +";");
        printEmptyLine();
        printImport();

        printEmptyLine();
       // println("@Component");
        println("public interface " + context.getServiceName());
        println("{");
        printEmptyLine();
       // printlni1("@Autowired");
       // printlni1(context.getRepositoryName() + " " + context.getRepositoryName().substring(0,1).toLowerCase() +
         //           context.getRepositoryName().substring(1) + ";");
        printlni1("public void save("+context.getEntityClassName()+" "+context.getEntityClassName().substring(0,1).toLowerCase()+context.getEntityClassName().substring(1) + ");");
        printEmptyLine();
        printlni1("public " +context.getEntityClassName() +" find(String id);");
        printEmptyLine();
        printlni1("public void delete(String id);");
        println("}");
        flush();
    }
}
