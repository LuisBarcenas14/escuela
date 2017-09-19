
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collections;


public class Main {

    
    public static void main(String[] args) throws IOException {
        // TODO code application logic here
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        BigInteger bi1, bi2;
        BigInteger p[]={ new BigInteger("2"), new BigInteger("3"), new BigInteger("5"),new BigInteger("7")};
        //int e[]=new int[4];
        int pint[]={2,3,5,7};
        ArrayList<Integer> elements;
        String s;
        int i=0,k;
        while((s=bf.readLine())!=null){
            if(s.equals("-1")){ break; }
            elements = new ArrayList();
            if(s.length()==1){
                System.out.println("1"+s);
                continue;
            }
            bi1=new BigInteger(s);
            
            for(int j=0;j<4;j++){
               //e[j]=0;
               i=0; 
               while(bi1.mod(p[j]).compareTo(BigInteger.ZERO)==0){
                    bi1 = bi1.divide(p[j]);
                    i++;
                    if(pint[j]==2 && i==3){ i=0; elements.add(8); }
                    else if(pint[j]==3 && i==2){ i=0; elements.add(9);}
                    else if(pint[j]>3){ elements.add(pint[j]); }
                }
                if(i==1 && pint[j]<=3){ elements.add(pint[j]); }
                if(i==2 && pint[j]==2){ elements.add(pint[j]*pint[j]); }
            }
            if(bi1.compareTo(BigInteger.ONE)==0){
                Collections.sort(elements);
                if(elements.get(0)==2 && elements.get(1)==3){
                    elements.set(1, 6);
                    elements.remove(0);
                    Collections.sort(elements);
                }else if(elements.get(0)==3 && elements.get(1)==4){
                    elements.set(0, 2);
                    elements.set(1, 6);
                    Collections.sort(elements);
                }
                for (int c: elements) {
                    System.out.print(c);
                }
                System.out.println("");
            }else{
                System.out.println("There is no such number.");
            }
        }
    }
}