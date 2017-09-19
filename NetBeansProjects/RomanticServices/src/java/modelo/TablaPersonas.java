/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;

/**
 *
 * @author HectorAdolfo
 */
public class TablaPersonas {
    public static ArrayList<Persona> personas=new ArrayList<Persona>();
    public static Boolean agregaPersona(Persona p) {
        return personas.add(p);
    }
    public static ArrayList<Persona> checaCompatibles(String sexo, int edad, String signo){
        ArrayList<Persona> candidatos=new ArrayList<>();
        for (Persona p: personas) {
            if (!p.getSexo().trim().equals(sexo.trim())) {
                candidatos.add(p);
            } else {
            }
        }
        return candidatos;
    }
    
    public static ArrayList<Persona> regresaLista(){
        ArrayList<Persona> candidatos=new ArrayList<>();
        for (Persona p: personas) {
            candidatos.add(p);
        }
        return candidatos;
    }
}

