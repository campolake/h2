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
        codeName = context.getRepositoryName();
        initWriter(context.getRepositoryPath() + "\\" + codeName + ".java");
        setPackageName(codeNameContext.getRepositoryNamespace());
       // addImport("org.springframework.data.jpa.repository.JpaSpecificationExecutor");
       // addImport("org.springframework.data.jpa.repository.Query");
       // addImport("org.springframework.data.repository.CrudRepository");
        addImport(context.getRepositoryCustomeInterfaceNamespace()+"."+context.getRepositoryCustomeName());
       // addImport("org.springframework.data.repository.query.Param");
       // addImport("com.aims.model."+codeName+"Entity");
        addImport(context.getEntityNamespace()+"."+context.getEntityClassName());
        addImport("com.cpic.caf.core.repository.EntityRepository");
       // addImport("java.util.List");
    }


    @Override
    public void generate() throws IOException {
        println("package " + context.getRepositoryNamespace() + ";");
        printEmptyLine();
        printImport();
        printEmptyLine();
        String entityName  = context.getEntityClassName();
        println("public interface "+ context.getRepositoryName() +" extends EntityRepository<"+entityName+", String>,"+context.getRepositoryCustomeName());
        println("{");
        printEmptyLine();
        println("}");
        flush();
    }
}
