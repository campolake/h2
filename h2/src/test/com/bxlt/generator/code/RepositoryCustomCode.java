package com.bxlt.generator.code;

import com.bxlt.generator.Column;
import com.bxlt.generator.Table;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

/**
 * Created by wangjw on 2016/7/1.
 */
public class RepositoryCustomCode extends Code  {

    public RepositoryCustomCode (CodeNameContext codeNameContext) throws IOException {
        super(codeNameContext);
        initWriter(context.getRepositoryCustomPath() + "\\" + context.getRepositoryCustomeName() + ".java");
        codeName = context.getRepositoryCustomeName();

        setPackageName(codeNameContext.getRepositoryCustomeInterfaceNamespace());
        addImport("org.springframework.data.domain.Page");
        addImport("org.springframework.data.domain.Pageable");
        addImport(context.getEntityNamespace() + "." + context.getEntityClassName());
        addImport("java.util.List");
        addImport("java.util.Map");
    }

    @Override
    public void generate() throws IOException {
        println("package com.aims.repository");
        printEmptyLine();
        printImport();

        printEmptyLine();
        String name = codeName + "RepositoryCustom";
        String entityName = context.getEntityClassName();

        print("public interface " + name);
        print("{");
        println("Page<"+entityName+"> query(String hql, Map<String, Object> map, Pageable pageable);");
        println("List<"+entityName+"> query(String hql, Map<String, Object> map);");
        print("}");
        flush();

    }


}
