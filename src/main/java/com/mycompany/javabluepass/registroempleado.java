package com.mycompany.javabluepass;

/**
 * Molde para los datos de empleados de Bluepass
 * @author Valentina
 */
public class registroempleado {
    // 1. Atributos (las variables)
    private String cedula;
    private String primer_nombre;
    private String segundo_nombre;
    private String primer_apellido;
    private String segundo_apellido;
    private String correo_electronico;
    private String celular;
    private int edad;
    private String lugar_residencia;

    // 2. Constructor vacío
    public registroempleado() {
    }

    // 3. Métodos SET (para recibir datos)
    public void setCedula(String cedula) { this.cedula = cedula; }
    public void setPrimer_nombre(String primer_nombre) { this.primer_nombre = primer_nombre; }
    public void setSegundo_nombre(String segundo_nombre) { this.segundo_nombre = segundo_nombre; }
    public void setPrimer_apellido(String primer_apellido) { this.primer_apellido = primer_apellido; }
    public void setSegundo_apellido(String segundo_apellido) { this.segundo_apellido = segundo_apellido; }
    public void setCorreo_electronico(String correo_electronico) { this.correo_electronico = correo_electronico; }
    public void setCelular(String celular) { this.celular = celular; }
    public void setEdad(int edad) { this.edad = edad; }
    public void setLugar_residencia(String lugar_residencia) { this.lugar_residencia = lugar_residencia; }

    // 4. Métodos GET (para sacar datos)
    public String getCedula() { return cedula; }
    public String getPrimer_nombre() { return primer_nombre; }
    public String getSegundo_nombre() { return segundo_nombre; }
    public String getPrimer_apellido() { return primer_apellido; }
    public String getSegundo_apellido() { return segundo_apellido; }
    public String getCorreo_electronico() { return correo_electronico; }
    public String getCelular() { return celular; }
    public int getEdad() { return edad; }
    public String getLugar_residencia() { return lugar_residencia; }
}
