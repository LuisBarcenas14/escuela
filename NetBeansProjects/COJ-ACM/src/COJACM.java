
import java.math.BigInteger;
import java.util.Scanner;


public class COJACM {

    public static void main(String[] args) {
        // TODO code application logic here
        Scanner in = new Scanner(System.in);
        BigInteger bi;
        String n;
        int t = in.nextInt();
        for (int i = 0; i < t; i++) {
            long arr[] = new long[10];
            n = in.next();
            if(n.equals("0")){
                System.out.println("0");
                continue;
            }
            boolean negative=false;
            for (int j = 0; j < n.length(); j++) {
                if(j==0 && n.charAt(j) == '-'){
                    negative=true;
                    continue;
                }
                arr[n.charAt(j)-'0']++;
            }
            if(negative) System.out.print("-");
            for (int j = 1; j <= 9 && !negative; j++) {
                while(arr[j]-- > 0){
                    System.out.print(j);
                    while(arr[0]-- >0){
                        System.out.print("0");
                    }
                }
            }
            for (int j = 9; j >= 0 && negative; j--) {
                while(arr[j]-- > 0){
                    System.out.print(j);
                }
            }
            System.out.println("");
        }
    }
    
}


/*
public static void main(String[] args) {
        // TODO code application logic here
        Scanner in = new Scanner(System.in);
        BigInteger bi;
        long k, r;
        String n;
        int t = in.nextInt();
        for (int i = 0; i < t; i++) {
            n = in.next();
            k = in.nextLong();
            r = in.nextLong();
            for (int j = 0; j < 10; j++) {
                
            }
        }
    }
*/