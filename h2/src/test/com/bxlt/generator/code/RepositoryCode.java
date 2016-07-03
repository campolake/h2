package com.bxlt.generator.code;

import com.bxlt.generator.Column;
import com.bxlt.generator.Table;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

/**
 * Created by wangjw on 2016/7/1.
 */
public class RepositoryCode extends Code  {

    public  RepositoryCode(CodeNameContext codeNameContext) throws IOException {
        super(codeNameContext);
        setPackageName(codeNameContext.getRepositoryNamespace());
        addImport("org.springframework.data.jpa.repository.JpaSpecificationExecutor");
        addImport("org.springframework.data.jpa.repository.Query;");
        addImport("org.springframework.data.repository.CrudRepository");
        addImport("org.springframework.data.repository.query.Param");
        addImport("com.aims.model."+codeName+"Entity");
        addImport("java.util.List");
    }


    @Override
    public void generate() throws IOException {
        writer.write("package com.aims.repository;");
        printEmptyLine();
        printImport();
        String entityName  = codeName + "Entity";
        println("public interface "+codeName+"Repository extends CrudRepository<"+entityName+", String>, JpaSpecificationExecutor<"+entityName+"> ");
        println("{");
        printEmptyLine();
        println("}");
        flush();
    }
}
