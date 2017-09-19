package pojo;

public class Alumno {

    private String nombre;

    private float info;

   public Alumno(String nombre, float info) {
        this.nombre = nombre;
        this.info = info;
    }

    public float getInfo() {
        return info;
    }

    public void setInfo(float info) {
        this.info = info;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String toString() {
        return nombre + "," + info;
    }
}
