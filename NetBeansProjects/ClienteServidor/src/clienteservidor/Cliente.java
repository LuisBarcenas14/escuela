package clienteservidor;

import java.net.*;
import java.io.*;

class Cliente {

    public static void main(String[] args) {
        int port = 5000;
        Socket cliente = null;
        PantallaCliente ph = new PantallaCliente();
        ph.setVisible(true);
        try {
            //Se asigna una máquina que será el servidor
            //se hace la conexión al servidor por el nombre y el puerto
            cliente = new Socket("localhost", port);
        } catch (IOException ioe) {
            ioe.printStackTrace();
            System.exit(0);
        }
        try {
            // getInputStream() da el flujo de entrada de bytes
            // InputStreamReader convierte un flujo de byte a flujo de caracteres
            // BufferedReader permite leer lineas completas
            InputStream flujoBE = cliente.getInputStream();
            Reader flujoCE = new InputStreamReader(flujoBE);
            BufferedReader reader = new BufferedReader(flujoCE);
            //se asocia un flujo de salida al cliente
            //con getOutputStream()
            OutputStream flujoBS = cliente.getOutputStream();
            Writer flujoCS = new OutputStreamWriter(flujoBS);
            BufferedWriter writer = new BufferedWriter(flujoCS);
            //envia su nombre de host al servidor
            //writer.write(InetAddress.getLocalHost() + "\n");
            writer.write("Barcenas\n");
            writer.flush();
            String entrada;
            entrada = reader.readLine();
            while (entrada != null) {
                ph.getTextArea().append(entrada + "\n");
                entrada = reader.readLine();
            }
            reader.close();
            writer.close();
        } catch (IOException ioe1) {
        }
    }
}
