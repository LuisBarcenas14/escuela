import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Arrays;

public class Main {
    
    public static int m[][];
    public static int f[];
    
    public static void main(String[] args) throws IOException {
        BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
        m = new int[79][2];
        f = new int[79];
        String s,s1,s2;
        int n,h,h2,m2,k=0;
        
        for (int i = 0; i < 24; i++) {
            for (int j = 0; j <= 59; j++) {
                if(i==0) s1="";
                else s1=i+"";
                
                if(j<10 && i>=1){ s2="0"+j; }
                else{ s2=j+""; }
                
                if(esPalindromo(s1+s2)){
                    if("".equals(s1)) s1="0";
                    f[k]= (Integer.parseInt(s1)*100)+(Integer.parseInt(s2));
                    m[k][0]= Integer.parseInt(s1);
                    m[k][1]= Integer.parseInt(s2);
                    //System.out.println(f[k]);
                    k++;
                }
            }
        }
        //System.out.println("K: "+k);
        n = Integer.parseInt(bf.readLine());
        while((s=bf.readLine())!=null){
            s1=s.substring(0,2);
            s2=s.substring(3,5);
            int x = (Integer.parseInt(s1)*100)+Integer.parseInt(s2)+1;
            //System.out.println("x: "+x);
            if(x>2332){ System.out.println("00:00"); continue; }
            int i=Arrays.binarySearch(f, x);
            if(i<0){ i*=-1; i--; } 
            System.out.printf("%02d:%02d\n",m[i][0], m[i][1]);
            //System.out.println(s1+":"+s2);
        }
    }
    
    public static boolean esPalindromo(String s){
        for (int i = 0,j=s.length()-1; i<=j ; i++,j--) {
            if(s.charAt(i)!=s.charAt(j)) return false;
        }
        return true;
    }
    
}
