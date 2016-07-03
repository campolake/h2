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
        setPackageName(context.getServiceNamespace());
        addImport("com.aims.model."+ codeName);
        addImport("com.aims.repository.BjShapeRepository");
    }


    @Override
    public void generate() throws IOException {
        println("package com.aims.service");
        printImport();
        printEmptyLine();
        println("");
    }
}
