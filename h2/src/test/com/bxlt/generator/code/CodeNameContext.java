package com.bxlt.generator.code;

import com.bxlt.generator.Table;

import java.io.File;

/**
 * Created by wangjw on 2016/7/3.
 */
public class CodeNameContext {

    private final String filePath = "D:\\javaout";

    private Table table;
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

    /**
     *
     * @param tab 表的名称
     */
    public CodeNameContext(Table tab)
    {
        this.table = tab;
        tableName = tab.getName();
        baseNamespace = "com.aims";
        entityClassName = tableName + "Entity";
        repositoryName = tableName + "Repository";
        repositoryCustomeName = tableName + "RepositoryCustom";
        repositoryImplName = tableName + "RepositoryImpl";
        serviceName = tableName + "Service";

        entityNamespace = baseNamespace + ".entity";
        repositoryNamespace = baseNamespace + ".repository";
        repositoryCustomeInterfaceNamespace = baseNamespace + ".custom";
        repositoryImplNamespace = baseNamespace + ".impl";
    }


    private void makeSureDir()
    {
        File f1 =  new File(filePath +"\\" + ent)
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
}
