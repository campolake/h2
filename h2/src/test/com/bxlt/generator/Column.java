package com.bxlt.generator;

/**
 * Created by wangjw on 2016/6/30.
 */
public class Column  extends  Prepared{

    private  String name;

    private  boolean empty;

    private Class<?> columnType;

    private  String comment;

    private  int length;


    public   Column(String name,boolean empty,Class<?> type,String comment,int len)
    {
        this.name = name;
        this.empty = empty;
        this.columnType = type;
        this.comment = comment;
        this.length = len;
    }




    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isEmpty() {
        return empty;
    }

    public void setEmpty(boolean empty) {
        this.empty = empty;
    }

    public Class<?> getColumnType() {
        return columnType;
    }

    public void setColumnType(Class<?> columnType) {
        this.columnType = columnType;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }
}
