package clienteservidor;

import java.net.*;
import java.io.*;

public class Servidor {

    public static void main(String[] args) throws IOException {
        int port = 5000;
        //La clase ServerSocket sirve para implementar
        //un socket en el servidor
        //se crea una referencia a un objeto de tipo ServerSocket
        ServerSocket server = null;
        try {
            //creando el socket y abriendo el puerto
            //port determina el número de puerto que se utiliza
            server = new ServerSocket(port);
            //getLocalPort obtiene el puerto asociado al socket
            System.out.print("El puerto utilizado por el socket es: ");
            System.out.println(server.getLocalPort());
            System.out.println("Los clientes deberán conectarse a este servidor usando este puerto");
            //getLocalHost obtiene la IP de la máquina
            System.out.print("La dirección IP del servidor es: ");
            System.out.println(InetAddress.getLocalHost());

        } catch (IOException ioe) {
            System.err.println("No se puede correr en el puerto " + port);
            System.exit(0);
        }
        while (true) {

            System.out.println("Esperando un cliente");
            //Al encontrar una petición de conexión está se
            //acepta
            Socket conexion = server.accept();
            //Crea un nuevo hilo para atender a este cliente
            new AtiendePeticion(conexion).start();

        }
    }
}

class AtiendePeticion extends Thread {

    Socket s;

    AtiendePeticion(Socket s) {
        this.s = s;
    }

    @Override
    public void run() {
        try {
            System.out.println("Acepta conexión");
            //se asocia a un flujo al cliente que solicita la conexión
            // getInputStream() da el flujo de entrada de bytes
            // InputStreamReader convierte un flujo de byte a flujo de caracteres
            // BufferedReader permite leer lineas completas
            InputStream flujoBE = s.getInputStream();
            Reader flujoCE = new InputStreamReader(flujoBE);
            BufferedReader reader = new BufferedReader(flujoCE);
            //se asocia un flujo de salida al cliente
            //con getOutputStream()
            OutputStream flujoBS = s.getOutputStream();
            Writer flujoCS = new OutputStreamWriter(flujoBS);
            BufferedWriter writer = new BufferedWriter(flujoCS);

            System.out.println("El cliente es " + reader.readLine());
            writer.write("Conectado al servidor " + s.getInetAddress() + "\n");
            writer.flush();

            // Lee un archivo en el directorio local y lo envía al flujo del cliente
            BufferedReader br;
            FileReader fr;
            String linea;

            fr = new FileReader("cara.txt");
            br = new BufferedReader(fr);
            linea = br.readLine();
            while (linea != null) {
                writer.write(linea+"\n");
                writer.flush();
                linea = br.readLine();
            }
            fr.close();
            br.close();

            //se cierran los flujos
            reader.close();
            writer.close();
            //se cierra la conexión
            s.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
