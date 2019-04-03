/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 *
 * @author David
 */
public class Test {
    public static void main(String[] args) {
        List<Integer> ss=new ArrayList();
        ss.add(10);
        ss.add(20);
        ss.add(30);
        ss.add(40);
        System.out.println(ss);
        //ss.remove(30);
        //ss.remove(new Integer(30));
        //System.out.println(ss);
        
        Iterator s=ss.iterator();
        System.out.println(s.hasNext());
        System.out.println(s.next());
        System.out.println(s.next());
        System.out.println(s.next());
    }
}
