package com.bxlt.generator.code;

import com.bxlt.generator.Column;
import com.bxlt.generator.Comment;
import com.bxlt.generator.Table;
import com.bxlt.generator.code.Code;

import java.io.IOException;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by wangjw on 2016/7/1.
 */
public class EntityCode extends Code {

    public  EntityCode(CodeNameContext codeNameContext) throws IOException {

        super(codeNameContext);
        initWriter(context.getEntityPath() + "\\" + context.getEntityClassName() + ".java");
        setPackageName(codeNameContext.getEntityNamespace());
        addImport("java.util.Date");
        addImport("com.fasterxml.jackson.annotation.JsonFormat");
        addImport("org.hibernate.validator.constraints.Length");
        addImport("javax.persistence.Column");
        addImport("javax.persistence.Entity");
        addImport("javax.persistence.Id");
        addImport("org.hibernate.validator.constraints.NotEmpty");
        addImport("javax.persistence.Table");
        addImport("java.io.Serializable");
    }


    @Override
    public void generate() throws IOException {
        println("package " + packageName +";");
        printEmptyLine();
        printImport();
        printEmptyLine();
        println("@Entity");
        println("@Table(name = \""+ context.getTableName() +"\")");
        println("public class " + context.getEntityClassName() + " implements Serializable");
        println("{");


        for(Column c:columns)
        {
            printEmptyLine();
            printlni1("@Column");
            Class<?> typeName = c.getColumnType();
            String fieldName = c.getName();
            String lowerFieldName = fieldName.toLowerCase();
            String firstUpperFieldName = lowerFieldName.substring(0,1).toUpperCase() + lowerFieldName.substring(1);
            String firstUpperName = getColumnName(lowerFieldName);
            if (typeName == String.class)
            {
                if(c.isEmpty()) {
                    printlni1("@NotEmpty(message = \""+c.getComment()+"不能为空\")");
                }
                printlni1("@Length(min=0, max=" + c.getLength() + ",message=\"" + c.getComment() + "超出长度\")");
                printlni1("private String " + firstUpperName + ";" + "//" + c.getComment());
            }
            else if (typeName == double.class)
            {
                printlni1("private double " + firstUpperName + ";" + "//" + c.getComment());
            }
            else if (typeName == int.class)
            {
                printlni1("private int " +firstUpperName + ";" + "//" + c.getComment());
            }
            else if(typeName == Date.class)
            {
                printlni1("@JsonFormat(pattern = \"yyyy-MM-dd HH:mm:ss\", timezone = \"Asia/Shanghai\")");
                printlni1("private Date " + firstUpperName + ";" + "//" + c.getComment());;
            }
        }

        printEmptyLine();
        printEmptyLine();
        printEmptyLine();

        for(Column c:columns)
        {
            Class<?> typeName = c.getColumnType();
            String fieldName = c.getName();
            String lowerFieldName = fieldName.toLowerCase();
            String firstUpperFieldName = getFiledColumnName(lowerFieldName);
            String firstUpperName = getColumnName(lowerFieldName);
            if (typeName == String.class)
            {
                printlni1("public String get"+firstUpperFieldName + "()");
                printlni1("{");
                printlni2("return this." +firstUpperName + ";");
                printlni1("}");
                printEmptyLine();

                printlni1("public void set"+firstUpperFieldName + "(String " + lowerFieldName + ")");
                printlni1("{");
                printlni2("this." + firstUpperName + " = " + lowerFieldName + ";");
                printlni1("}");
                printEmptyLine();
                printEmptyLine();
            }
            else if (typeName == double.class)
            {
                printlni1("public double get"+firstUpperFieldName + "()");
                printlni1("{");
                printlni2("return this." +firstUpperName + ";");
                printlni1("}");
                printEmptyLine();

                printlni1("public void set"+firstUpperFieldName + "(double " + lowerFieldName + ")");
                printlni1("{");
                printlni2("this." + firstUpperName + " = " + lowerFieldName + ";");
                printlni1("}");
                printEmptyLine();
                printEmptyLine();
            }
            else if (typeName == int.class)
            {
                printlni1("public int get"+firstUpperFieldName + "()");
                printlni1("{");
                printlni2("return this." +firstUpperName + ";");
                printlni1("}");
                printEmptyLine();

                printlni1("public void set"+ firstUpperFieldName + "(int " + lowerFieldName + ")");
                printlni1("{");
                printlni2("this." +firstUpperName + " = " + lowerFieldName + ";");
                printlni1("}");
                printEmptyLine();
                printEmptyLine();
            }
            else if(typeName == Date.class)
            {
                printlni1("public Date get"+ firstUpperFieldName + "()");
                printlni1("{");
                printlni2("return this." +firstUpperName + ";");
                printlni1("}");
                printEmptyLine();

                printlni1("public void set"+firstUpperFieldName + "(Date " + lowerFieldName + ")");
                printlni1("{");
                printlni2("this." + firstUpperName + " = " + lowerFieldName + ";");
                printlni1("}");
                printEmptyLine();
                printEmptyLine();
            }
        }
        println("}");

        flush();

    }

    private String getColumnName(String columnName)
    {
        if (!columnName.contains("_"))
            return columnName;
        String[] cols  = columnName.split("_");
        String name = cols[0];
        for(int i=1;i<cols.length;i++)
        {
            name += cols[i].substring(0,1).toUpperCase() + cols[i].substring(1);
        }
        return name;
    }

    private  String getFiledColumnName(String columnName)
    {
        if (!columnName.contains("_"))
            return columnName;
        String[] cols  = columnName.split("_");
        String name = "";
        for(int i=0;i<cols.length;i++)
        {
            name += cols[i].substring(0,1).toUpperCase() + cols[i].substring(1);
        }
        return name;
    }
}
