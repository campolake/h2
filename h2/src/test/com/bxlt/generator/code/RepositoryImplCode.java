package com.bxlt.generator.code;

import com.bxlt.generator.Column;
import com.bxlt.generator.Table;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

/**
 * Created by wangjw on 2016/7/3.
 */
public class RepositoryImplCode extends Code {

    public RepositoryImplCode(CodeNameContext context) throws IOException {
        super(context);
        initWriter(context.getReposotryImplPath() + "\\" + context.getRepositoryImplName() + ".java");
        codeName = context.getRepositoryImplName();
        setPackageName(context.getRepositoryImplNamespace());
        addImport(context.getEntityNamespace()+"."+context.getEntityClassName()); //Entity
        addImport(context.getRepositoryCustomeInterfaceNamespace()+"."+context.getRepositoryCustomeName());//interface
        addImport("com.cpic.caf.core.repository.jpa.BaseHibernate4QueryDao");
        addImport("org.springframework.data.domain.Page");
        addImport("org.springframework.data.domain.Pageable");
        addImport("java.util.List");
        addImport("java.util.Map");
    }


    @Override
    public void generate() throws IOException {
        println("package "+ context.getRepositoryImplNamespace() +";");
        printEmptyLine();
        printImport();
        printEmptyLine();
        String className = context.getRepositoryImplName();
        println("public class " + className + " extends BaseHibernate4QueryDao<"+context.getEntityClassName()+"> implements "+context.getRepositoryCustomeName());
        println("{");
        printEmptyLine();
        printlni1("@Override");
        printlni1("public Page<"+ context.getEntityClassName() +"> query(String hql, Map<String, Object> map, Pageable pageable) {");
        printlni2("return this.findEntityObjects(hql, map, pageable);");
        printlni1("}");
        printEmptyLine();

        printlni1("@Override");
        printlni1("public List<"+context.getEntityClassName()+"> query(String hql, Map<String, Object> map) {");
        printlni2("return this.findEntityObjects(hql, map);");
        printlni1("}");

        printEmptyLine();
        println("}");
        flush();
    }
}
