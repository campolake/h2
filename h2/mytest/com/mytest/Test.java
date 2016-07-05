package com.mytest;

/**
 * Created by wangjw on 2016/7/5.
 */
public class Test {
    public static void main(String[] args)
    {
        String a = "1234";
        String c = "1234";
        String b = new String("1234");
        System.out.println(b.equals(a));
        System.out.println(a == b);
        System.out.println(a == c);
    }
}
