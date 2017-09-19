/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 *
 * @author barcenas
 */
public class COJ1556 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        String s = bf.readLine();
        String ss[]=s.split(" ");
        String l = ss[0];
        int a = Integer.parseInt(ss[1]);
        int n = l.length();
        a = a % n;
        String sb;
        while(a-->0){
            sb=l.substring(1,n);
            l = sb.concat(l.substring(0,1));
            System.out.println(l);
        }
        System.out.println(l.substring(n-2,n-1));
    }
    
}
