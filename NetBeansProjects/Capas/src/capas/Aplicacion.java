package capas;

import pojo.Alumno;
import java.io.IOException;
import java.util.ArrayList;

public class Aplicacion {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException {
        muestraPromedios();
        muestraMaterias();
    }

    public static void muestraPromedios() throws IOException {
        System.out.println("** Listado de Alumnos con Promedios **");
        ArrayList<Alumno> alumnos = Proceso.average("Alumnos.txt");
        for (Alumno alumno : alumnos) {
            System.out.println(alumno);
        }
    }
    
    public static void muestraMaterias() throws IOException {
        System.out.println("** Listado de Alumnos con Materias **");
        ArrayList<Alumno> alumnos2 = Proceso.count("Alumnos.txt");
        for (Alumno alumno : alumnos2) {
            System.out.println(alumno);
        }
    }

}
