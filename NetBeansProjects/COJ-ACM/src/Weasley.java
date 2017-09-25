
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Scanner;



public class Weasley {
    
    public static boolean comprobarPatron(ArrayList<BigInteger> list, long rep){
        for (int i = 1; i < rep; i++) {
            bi2 = new BigInteger(bi.toString()+bi0.toString());
            bi = bi2.mod(biR);
            if(bi.compareTo(list.get(i))!=0){
                return false;
            }
        }
        return true;
    }
    
    public static BigInteger bi, bi0, biR, bi2, biK;
    
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner in = new Scanner(System.in);
        
        long k, r, res, rep;
        String n;
        int t = in.nextInt();
        
        for (int i = 0; i < t; i++) {
            
            n = in.next();
            k = in.nextLong();
            r = in.nextLong();
            rep = 1;
            bi = bi0 = new BigInteger(n);
            biR = new BigInteger(Long.toString(r));
            bi = bi.mod(biR);
            ArrayList<BigInteger> list = new ArrayList();
            list.add(bi);
            //Repeticiones de K
            boolean band = false;
            for (int j = 1; j < k && !band; j++) {
                bi2 = new BigInteger(bi.toString()+bi0.toString());
                bi = bi2.mod(biR);
                //System.out.println(j+" bi: "+bi+" bi0: "+bi0+" = "+bi.compareTo(bi0));
                if(bi.compareTo(bi0)==0){
                    
                    band = comprobarPatron(list, rep);
                    //System.out.println(j+" comprueba patrón: "+band+" rep: "+rep);
                }
                
                list.add(bi);
                rep++;
            }
            rep--;
            
            if(band){
                biK = new BigInteger(Long.toString(k));
                String st = biK.mod(new BigInteger(Long.toString(rep))).toString();
                long ind = Long.parseLong(st);
                ind = (ind-1+rep)%rep;
                //System.out.println("rep: "+rep+" ind: "+ind+" bi0: "+bi0+" st: "+st);
                System.out.println(list.get((int)ind));
            }else{
                System.out.println(bi);
            }
            
        }
    }
    
}


