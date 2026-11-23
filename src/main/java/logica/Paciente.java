
package logica;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.OneToMany;

@Entity
public class Paciente extends Persona implements Serializable{

    private boolean eps;
    private String tipo_sangre;
    @OneToOne
    private Responsable unResponsable;
    @OneToMany(mappedBy = "pacien")
    private List<Turno>listaTurnos;

    public Paciente() {
    }

    public Paciente(boolean eps, String tipo_sangre, Responsable unResponsable, List<Turno> listaTurnos, int id, String dni, String nombre, String apellidos, String telefono, String direccion, String fecha_nac) {
        super(id, dni, nombre, apellidos, telefono, direccion, fecha_nac);
        this.eps = eps;
        this.tipo_sangre = tipo_sangre;
        this.unResponsable = unResponsable;
        this.listaTurnos = listaTurnos;
    }

    public void setEps(boolean eps) {
        this.eps = eps;
    }

    public void setTipo_sangre(String tipo_sangre) {
        this.tipo_sangre = tipo_sangre;
    }

    public void setUnResponsable(Responsable unResponsable) {
        this.unResponsable = unResponsable;
    }

    public void setListaTurnos(List<Turno> listaTurnos) {
        this.listaTurnos = listaTurnos;
    }

    public boolean isEps() {
        return eps;
    }

    public String getTipo_sangre() {
        return tipo_sangre;
    }

    public Responsable getUnResponsable() {
        return unResponsable;
    }

    public List<Turno> getListaTurnos() {
        return listaTurnos;
    }
    
}
