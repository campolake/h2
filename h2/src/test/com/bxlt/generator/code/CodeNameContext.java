package com.bxlt.generator.code;

import com.bxlt.generator.Table;

import java.io.File;

/**
 * Created by wangjw on 2016/7/3.
 */
public class CodeNameContext {

    private Table table;
    private String simpleTableName;
    private String tableName;
    private String entityClassName;
    private String repositoryName;
    private String repositoryCustomeName;
    private String repositoryImplName;
    private String serviceName;

    private String baseNamespace;
    private String entityNamespace;
    private String repositoryNamespace;
    private String repositoryCustomeInterfaceNamespace;
    private String repositoryImplNamespace;
    private String serviceNamespace;


    private String basePath;
    private String entityPath;
    private String repositoryPath;
    private String reposotryImplPath;
    private String repositoryCustomPath;
    private String servicePath;

    /**
     *
     * @param tab 表的名称
     */
    public CodeNameContext(Table tab,String baseFilePath)
    {
        this.table = tab;
        basePath = baseFilePath;
        tableName = tab.getName();
        makeSureDir();
        baseNamespace = "com.aims";
        simpleTableName = getTableName(tableName);
        entityClassName = simpleTableName + "Entity";
        repositoryName = simpleTableName + "Repository";
        repositoryCustomeName = simpleTableName + "RepositoryCustom";
        repositoryImplName = simpleTableName + "RepositoryImpl";
        serviceName = simpleTableName + "Service";

        entityNamespace = baseNamespace + ".entity";
        repositoryNamespace = baseNamespace + ".repository";
        repositoryCustomeInterfaceNamespace = baseNamespace + ".custom";
        repositoryImplNamespace = baseNamespace + ".impl";
    }

    private  String getTableName(String tableName)
    {
        String[] strs= tableName.toLowerCase().split("_");
        String name = "";
        for(String s:strs)
        {
            name += s.substring(0,1).toUpperCase() + s.substring(1);
        }
        return name;
    }


    private void makeSureDir()
    {
        entityPath = basePath + "\\Entity";
        File f1 =  new File(entityPath);
        if (!f1.exists())
            f1.mkdir();
        repositoryPath = basePath + "\\repository";
        File f2 =  new File(repositoryPath);
        if (!f2.exists())
            f2.mkdir();
        repositoryCustomPath = basePath + "\\custom";
        File f3 =  new File(repositoryCustomPath);
        if (!f3.exists())
            f3.mkdir();
        reposotryImplPath = basePath + "\\impl";
        File f4 =  new File(reposotryImplPath);
        if (!f4.exists())
            f4.mkdir();
        servicePath = basePath + "\\service";
        File f5 =  new File(servicePath);
        if (!f5.exists())
            f5.mkdir();
    }

    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getEntityClassName() {
        return entityClassName;
    }

    public void setEntityClassName(String entityClassName) {
        this.entityClassName = entityClassName;
    }

    public String getRepositoryName() {
        return repositoryName;
    }

    public void setRepositoryName(String repositoryName) {
        this.repositoryName = repositoryName;
    }

    public String getRepositoryCustomeName() {
        return repositoryCustomeName;
    }

    public void setRepositoryCustomeName(String repositoryCustomeName) {
        this.repositoryCustomeName = repositoryCustomeName;
    }

    public String getRepositoryImplName() {
        return repositoryImplName;
    }

    public void setRepositoryImplName(String repositoryImplName) {
        this.repositoryImplName = repositoryImplName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }

    public String getBaseNamespace() {
        return baseNamespace;
    }

    public void setBaseNamespace(String baseNamespace) {
        this.baseNamespace = baseNamespace;
    }

    public String getEntityNamespace() {
        return entityNamespace;
    }

    public void setEntityNamespace(String entityNamespace) {
        this.entityNamespace = entityNamespace;
    }

    public String getRepositoryNamespace() {
        return repositoryNamespace;
    }

    public void setRepositoryNamespace(String repositoryNamespace) {
        this.repositoryNamespace = repositoryNamespace;
    }

    public String getRepositoryCustomeInterfaceNamespace() {
        return repositoryCustomeInterfaceNamespace;
    }

    public void setRepositoryCustomeInterfaceNamespace(String repositoryCustomeInterfaceNamespace) {
        this.repositoryCustomeInterfaceNamespace = repositoryCustomeInterfaceNamespace;
    }

    public String getRepositoryImplNamespace() {
        return repositoryImplNamespace;
    }

    public void setRepositoryImplNamespace(String repositoryImplNamespace) {
        this.repositoryImplNamespace = repositoryImplNamespace;
    }

    public String getServiceNamespace() {
        return serviceNamespace;
    }

    public void setServiceNamespace(String serviceNamespace) {
        this.serviceNamespace = serviceNamespace;
    }

    public Table getTable() {
        return table;
    }

    public void setTable(Table table) {
        this.table = table;
    }


    public String getBasePath() {
        return basePath;
    }

    public void setBasePath(String basePath) {
        this.basePath = basePath;
    }

    public String getEntityPath() {
        return entityPath;
    }

    public void setEntityPath(String entityPath) {
        this.entityPath = entityPath;
    }

    public String getRepositoryPath() {
        return repositoryPath;
    }

    public void setRepositoryPath(String repositoryPath) {
        this.repositoryPath = repositoryPath;
    }

    public String getReposotryImplPath() {
        return reposotryImplPath;
    }

    public void setReposotryImplPath(String reposotryImplPath) {
        this.reposotryImplPath = reposotryImplPath;
    }

    public String getRepositoryCustomPath() {
        return repositoryCustomPath;
    }

    public void setRepositoryCustomPath(String repositoryCustomPath) {
        this.repositoryCustomPath = repositoryCustomPath;
    }

    public String getServicePath() {
        return servicePath;
    }

    public void setServicePath(String servicePath) {
        this.servicePath = servicePath;
    }
}
