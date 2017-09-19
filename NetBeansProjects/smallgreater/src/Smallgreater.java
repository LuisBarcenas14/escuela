import java.util.Scanner;


public class Smallgreater {
    
    public static void main(String[] args) {
        Scanner leer=new Scanner(System.in);
        while(leer.hasNext()){
            long m;
            int k;
            m=leer.nextLong();
            k=leer.nextInt();
            System.out.println(con(m,k));
        }
    }
    
    public static boolean band =false;
    
    public static int contar(char c[], int i){
        int b=0;
        for (int j = i; j >=0 && c[j]=='1'; j--) {
            b++;
        }
        return b;
    }
    public static int ultUno(char c[], int r){
        int b=0;
        for (int j = r-1; j >=0; j--) {
            if(c[j]=='1') return j;
        }
        return -1;
    }
    public static char[] recorrer(char c[], int k, int i, int u){
        while(i>u && !band){
                
            int cont = contar(c, i);
            if(cont >=k){
                band=true;
            }
            if(c[i]=='1' && c[i-1]=='0' && !band){
                c[i-1]='1';
                c[i]='0';
            }
            i--;
        }
        return c;
    }
    
    public static long con(long m, int k){
        long b=m;
        int cont=0;
        //StringBuilder st=new StringBuilder("");
        while(b>0){
            if((b&1)==1){
                cont++;
            }else{
                cont=0;
            }
            if(cont>=k){
                return m;
            }
            b=b>>1;
        }
        String s = Long.toBinaryString(m),s2,s3;
        char []c = s.toCharArray();
        int r = c.length;
        //boolean band =false;
        int act;
        band=false;
        while(cont<k && !band){
            int i=r-1;
            int u = ultUno(c, r), u2=u;
            cont =0;
            //Contar 1
            while(u2>=0 && c[u2]=='1'){
                if(c[u2]=='1')
                    cont ++;
                u2--;
            }
            System.out.println("1C: "+new String(c)+" cont: "+cont+" U: "+u);
            //Agregar 1 a la derecha
            int ut=u;
            while(u<r-1 && cont<k){
                c[++u]='1';
                cont++;
            }
            System.out.println("2C: "+new String(c)+" cont: "+cont+" U: "+u);
            
            if(c[r-1]=='1' && !band){
                c= recorrer(c,k,r,ut);
            }
            /*if(!band){
                s2=new String(c);
                s2=s2.concat("1");
                c = s2.toCharArray();
                r++;
                //System.out.println(c);
            }*/
        }
        long n;
        n = Long.parseLong(new String(c), 2);
        //return s;
        return n;
    }
    
}