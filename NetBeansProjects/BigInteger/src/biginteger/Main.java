package biginteger;

import java.math.BigInteger;

public class Main {
    
    public static BigInteger f[] = new BigInteger[6001];
    
    public static void factoriales(){
        f[0] = BigInteger.ONE;
        for (int i = 1; i < 6000; i++) {
            f[i] = f[i-1].multiply(new BigInteger(""+i));
        }
    }
    
    public static BigInteger factoriales2(int n){
        if(n == 0)
            return f[0] = BigInteger.ONE;
        return f[n] = factoriales2(n-1).multiply(new BigInteger(""+n));
    }
    
    
    public static void main(String[] args) {
        // TODO code application logic here
        BigInteger b2,b3;
        ///factoriales2(6000);
        for (int i = 0; i < 10; i++) {
            //System.out.println("F de "+i+" es "+f[i]);
            
        }
        String s="1234";
        s.
        System.out.println(factoriales2(4));
    }
    
}
