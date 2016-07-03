package com.bxlt.generator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * Created by wangjw on 2016/6/30.
 */
public class Table extends  Prepared {

    private List<Column> columns  =  new ArrayList<Column>();
    private HashMap<String,Column> columnHashMap = new HashMap<String, Column>();

    private String name;

    public void addColumn(Column c)
    {
        columnHashMap.put(c.getName(),c);
        columns.add(c);
    }


    public Column getColumn(String colName)
    {
        return columnHashMap.get(colName);
    }

    public List<Column> getColumns() {
        return columns;
    }

    public void setColumns(List<Column> columns) {
        this.columns = columns;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public  String getName()
    {
        return this.name;
    }


}
