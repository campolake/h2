package com.bxlt.generator.code;

import java.io.IOException;

/**
 * Created by c_machao-001 on 2016/7/4.
 */
public class ServiceImplCode extends  Code{
    public ServiceImplCode(CodeNameContext context) throws IOException {
        super(context);
        initWriter(context.getServiceImplPath() + "\\" + context.getServiceImplName() + ".java");
        setPackageName(context.getServiceImplNamespace());
        addImport("org.springframework.beans.factory.annotation.Autowired");
        addImport(context.getEntityNamespace() +"."+ context.getEntityClassName());
        addImport(context.getRepositoryNamespace()+"." + context.getRepositoryName());
        addImport(context.getServiceNamespace()+"."+context.getServiceName());
    }

    @Override
    public void generate() throws IOException {
        println("package " + packageName + ";");
        printEmptyLine();
        printImport();

        printEmptyLine();
        println("public class " + context.getServiceImplName() + " implements " + context.getServiceName());
        println("{");
        printEmptyLine();

        printlni1("@Autowired");
        printlni1(context.getRepositoryName() + " " + context.getRepositoryName().substring(0, 1).toLowerCase() + context.getRepositoryName().substring(1)+";");
        printEmptyLine();

        printlni1("@Override");
        printlni1("public void save(" + context.getEntityClassName() + " " + context.getEntityClassName().substring(0, 1).toLowerCase()
                + context.getEntityClassName().substring(1) + "){");
        printlni2(context.getRepositoryName().substring(0, 1).toLowerCase() + context.getRepositoryName().substring(1) + ".save("
                + context.getEntityClassName().substring(0, 1).toLowerCase() + context.getEntityClassName().substring(1) + ");");
        printlni1("}");
        printEmptyLine();

        printlni1("@Override");
        printlni1("public " + context.getEntityClassName() + " find(String id){");
        printlni2("return "+context.getRepositoryName().substring(0, 1).toLowerCase() + context.getRepositoryName().substring(1)+".findOne(id)"+";");
        printlni1("}");
        printEmptyLine();

        printlni1("@Override");
        printlni1("public void delete(String id){");
        printlni2(context.getRepositoryName().substring(0, 1).toLowerCase() + context.getRepositoryName().substring(1)+".delete(id)"+";");
        printlni1("}");
        printEmptyLine();

        printEmptyLine();
        println("}");
        flush();
    }
}
