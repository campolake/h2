package com.bxlt.generator.code;

import com.bxlt.generator.Column;
import com.bxlt.generator.Table;

import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wangjw on 2016/7/1.
 * 要产生的代码的基类
 */
public abstract  class Code {

    protected Table table;
    protected List<Column> columns;
    protected String packageName;
    protected List<String> packageImport  = new ArrayList<String>();
    protected String codeName;
    CodeNameContext context;
    Writer writer;
    protected Code(CodeNameContext codeNameContext) throws IOException {

        writer =  new FileWriter(""+ ".java");
        context = codeNameContext;
        this.table = context.getTable();
        this.columns = table.getColumns();
    }

    protected  void printImport() throws IOException {
        for(String s:packageImport)
        {
            println("import " + s + ";");
        }
    }

    public  void addImport(String imports)
    {
        packageImport.add(imports);
    }

    public List<String> getPackageImport() {
        return packageImport;
    }

    public void setPackageImport(List<String> packageImport) {
        this.packageImport = packageImport;
    }

    public String getPackageName() {
        return packageName;
    }

    public void setPackageName(String packageName) {
        this.packageName = packageName;
    }

    public String getCodeName() {
        return codeName;
    }

    public void setCodeName(String codeName) {
        this.codeName = codeName;
    }

    protected   void print(String code) throws IOException {
        writer.write(code);
    }

    protected void println(String code) throws IOException {
        writer.write(code);
        writer.write("\r\n");
    }

    protected void printlni1(String code) throws IOException {
        writer.write("\t");
        writer.write(code);
        writer.write("\r\n");
    }

    protected void printlni2(String code) throws IOException {
        writer.write("\t\t");
        writer.write(code);
        writer.write("\r\n");
    }

    protected void printEmptyLine() throws IOException {
        writer.write("\r\n");
    }


    public abstract  void generate() throws IOException;


    public void flush() throws IOException {
//        writer.close();
        writer.flush();
    }
}
