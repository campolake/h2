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
        setPackageName(context.getRepositoryImplNamespace());
        addImport("com.aims.model.T_File;"); //Entity
        addImport("com.aims.repository.FileRepositoryCustom;");//interface
        addImport("com.bxlt.jpa.BaseHibernate4QueryDao;");
        addImport("org.springframework.data.domain.Page");
        addImport("org.springframework.data.domain.Pageable");
        addImport("java.util.List");
        addImport("java.util.Map");
    }


    @Override
    public void generate() throws IOException {
        print("package "+ "");
        printImport();
        printEmptyLine();
        String className = codeName + "RepositoryImpl";
        print("public class " + className);
        print("{");
        printlni1("@Override");
        printlni1("public Page<"+codeName+"> query(String hql, Map<String, Object> map, Pageable pageable) {");
        printlni2("return this.findEntityObjects(hql, map, pageable);");
        printlni1("}");
        printEmptyLine();

        printlni1("@Override");
        printlni1("public List<"+codeName+"> query(String hql, Map<String, Object> map) {");
        printlni2("return this.findEntityObjects(hql, map);");
        printlni1("}");

        printEmptyLine();
        println("}");

    }
}
