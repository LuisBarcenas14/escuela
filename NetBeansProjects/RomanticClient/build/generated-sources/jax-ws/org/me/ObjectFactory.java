
package org.me;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the org.me package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _AgregaPersona_QNAME = new QName("http://me.org/", "agregaPersona");
    private final static QName _AgregaPersonaResponse_QNAME = new QName("http://me.org/", "agregaPersonaResponse");
    private final static QName _BuscaCompatible_QNAME = new QName("http://me.org/", "buscaCompatible");
    private final static QName _BuscaCompatibleResponse_QNAME = new QName("http://me.org/", "buscaCompatibleResponse");
    private final static QName _RegresaLista_QNAME = new QName("http://me.org/", "regresaLista");
    private final static QName _RegresaListaResponse_QNAME = new QName("http://me.org/", "regresaListaResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: org.me
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link AgregaPersona }
     * 
     */
    public AgregaPersona createAgregaPersona() {
        return new AgregaPersona();
    }

    /**
     * Create an instance of {@link AgregaPersonaResponse }
     * 
     */
    public AgregaPersonaResponse createAgregaPersonaResponse() {
        return new AgregaPersonaResponse();
    }

    /**
     * Create an instance of {@link BuscaCompatible }
     * 
     */
    public BuscaCompatible createBuscaCompatible() {
        return new BuscaCompatible();
    }

    /**
     * Create an instance of {@link BuscaCompatibleResponse }
     * 
     */
    public BuscaCompatibleResponse createBuscaCompatibleResponse() {
        return new BuscaCompatibleResponse();
    }

    /**
     * Create an instance of {@link RegresaLista }
     * 
     */
    public RegresaLista createRegresaLista() {
        return new RegresaLista();
    }

    /**
     * Create an instance of {@link RegresaListaResponse }
     * 
     */
    public RegresaListaResponse createRegresaListaResponse() {
        return new RegresaListaResponse();
    }

    /**
     * Create an instance of {@link Persona }
     * 
     */
    public Persona createPersona() {
        return new Persona();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregaPersona }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://me.org/", name = "agregaPersona")
    public JAXBElement<AgregaPersona> createAgregaPersona(AgregaPersona value) {
        return new JAXBElement<AgregaPersona>(_AgregaPersona_QNAME, AgregaPersona.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link AgregaPersonaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://me.org/", name = "agregaPersonaResponse")
    public JAXBElement<AgregaPersonaResponse> createAgregaPersonaResponse(AgregaPersonaResponse value) {
        return new JAXBElement<AgregaPersonaResponse>(_AgregaPersonaResponse_QNAME, AgregaPersonaResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BuscaCompatible }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://me.org/", name = "buscaCompatible")
    public JAXBElement<BuscaCompatible> createBuscaCompatible(BuscaCompatible value) {
        return new JAXBElement<BuscaCompatible>(_BuscaCompatible_QNAME, BuscaCompatible.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link BuscaCompatibleResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://me.org/", name = "buscaCompatibleResponse")
    public JAXBElement<BuscaCompatibleResponse> createBuscaCompatibleResponse(BuscaCompatibleResponse value) {
        return new JAXBElement<BuscaCompatibleResponse>(_BuscaCompatibleResponse_QNAME, BuscaCompatibleResponse.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RegresaLista }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://me.org/", name = "regresaLista")
    public JAXBElement<RegresaLista> createRegresaLista(RegresaLista value) {
        return new JAXBElement<RegresaLista>(_RegresaLista_QNAME, RegresaLista.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link RegresaListaResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://me.org/", name = "regresaListaResponse")
    public JAXBElement<RegresaListaResponse> createRegresaListaResponse(RegresaListaResponse value) {
        return new JAXBElement<RegresaListaResponse>(_RegresaListaResponse_QNAME, RegresaListaResponse.class, null, value);
    }

}
