/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.me;

import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

import modelo.*;

/**
 *
 * @author HectorAdolfo
 */
@WebService(serviceName = "RomanticWebService")
public class RomanticWebService {

    /**
     * Web service operation
     * @param nombre
     * @param telefono
     * @param sexo
     * @param edad
     * @param signo
     * @return 
     */
    @WebMethod(operationName = "agregaPersona")
    public String agregaPersona(@WebParam(name = "nombre") String nombre, @WebParam(name = "telefono") String telefono, @WebParam(name = "sexo") String sexo, @WebParam(name = "edad") int edad, @WebParam(name = "signo") String signo) {
        return TablaPersonas.agregaPersona(new Persona(nombre,telefono,sexo,edad,signo)).toString();
        
    }

    /**
     * Web service operation
     * @param sexo
     * @param edad
     * @param signo
     * @return 
     */
    @WebMethod(operationName = "buscaCompatible")
    public ArrayList<Persona> buscaCompatible(@WebParam(name = "sexo") String sexo, @WebParam(name = "edad") int edad, @WebParam(name = "signo") String signo) {
        return TablaPersonas.checaCompatibles(sexo, edad,signo);
    }

    /**
     * Web service operation
     * @return 
     */
    @WebMethod(operationName = "regresaLista")
    public ArrayList<Persona> regresaLista() {
        return TablaPersonas.regresaLista();
    }
}
