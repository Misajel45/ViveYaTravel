package modelo.dto;

public class Paquete {
    int idPaquete;
    String nombrePaquete;
    String descripcionPaquete;
    double precioPaquete;
    String imagen;

    public Paquete() {
    }

    public Paquete(int idPaquete, String nombrePaquete, String descripcionPaquete, double precioPaquete, String imagen) {
        this.idPaquete = idPaquete;
        this.nombrePaquete = nombrePaquete;
        this.descripcionPaquete = descripcionPaquete;
        this.precioPaquete = precioPaquete;
        this.imagen = imagen;
    }

    public int getIdPaquete() {
        return idPaquete;
    }

    public void setIdPaquete(int idPaquete) {
        this.idPaquete = idPaquete;
    }

    public String getNombrePaquete() {
        return nombrePaquete;
    }

    public void setNombrePaquete(String nombrePaquete) {
        this.nombrePaquete = nombrePaquete;
    }

    public String getDescripcionPaquete() {
        return descripcionPaquete;
    }

    public void setDescripcionPaquete(String descripcionPaquete) {
        this.descripcionPaquete = descripcionPaquete;
    }

    public double getPrecioPaquete() {
        return precioPaquete;
    }

    public void setPrecioPaquete(double precioPaquete) {
        this.precioPaquete = precioPaquete;
    }

    public String getImagen() {
        return imagen;
    }

    public void setImagen(String imagen) {
        this.imagen = imagen;
    }

    
}