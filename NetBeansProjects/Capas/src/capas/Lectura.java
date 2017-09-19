package capas;

import java.io.*;
import java.util.ArrayList;

public class Lectura {

    public static ArrayList<String> leeArreglo(String fileName) throws IOException {

        BufferedReader br = new BufferedReader(new FileReader(fileName));
       
            ArrayList<String> lines = new ArrayList<>();
            String line = br.readLine();

            while (line != null) {
                lines.add(line);
                line = br.readLine();
            }  
            br.close();
            return lines;
    }
}
