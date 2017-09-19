package capas;

import pojo.Alumno;
import java.io.IOException;
import java.util.ArrayList;


public class Proceso {
    public static ArrayList<Alumno> average(String filename) throws IOException {
      ArrayList<Alumno> arregloAlumnos = new ArrayList<>();   
      ArrayList<String> lines = Lectura.leeArreglo(filename);
      for (String s: lines){
          String[] oneLine = s.split(",");
          float suma = 0;
          for (int i = 1; i < oneLine.length; i++ ) {
              suma += Float.parseFloat(oneLine[i]);
          }
          float promedio = suma / (oneLine.length-1);
       arregloAlumnos.add(new Alumno(oneLine[0],promedio));
      }
      return arregloAlumnos;
    }
    
    public static ArrayList<Alumno> count(String filename) throws IOException {
      ArrayList<Alumno> arregloAlumnos = new ArrayList<>();   
      ArrayList<String> lines = Lectura.leeArreglo(filename);
      for (String s: lines){
          String[] oneLine = s.split(",");
          //System.out.println(oneLine[0]+","+(oneLine.length-1));
          float materias = oneLine.length-1;
          arregloAlumnos.add(new Alumno(oneLine[0],materias));
      }
      return arregloAlumnos;
    }
}
