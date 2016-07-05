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
        codeName = context.getServiceName();
        setPackageName(context.getServiceNamespace());
//        addImport(context.getene);
        //addImport("com.aims.repository.BjShapeRepository");
    }


    @Override
    public void generate() throws IOException {
        println("package " + context.getServiceNamespace() + ";");
        printImport();
        printEmptyLine();
        println("@Component");
        println("public class " + context.getServiceName());
        println("{");
        printEmptyLine();
        printlni1("@Autowired");
        printlni1(context.getRepositoryName() + " " + context.getRepositoryName().substring(0,1).toLowerCase() +
                    context.getRepositoryName().substring(1) + ";");
        printEmptyLine();
        println("}");
        flush();
    }
}
