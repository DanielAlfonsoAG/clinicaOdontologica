package logica;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import logica.Odontologo;
import logica.Paciente;

@Generated(value="EclipseLink-2.7.12.v20230209-rNA", date="2024-12-15T22:25:00")
@StaticMetamodel(Turno.class)
public class Turno_ { 

    public static volatile SingularAttribute<Turno, Odontologo> odonto;
    public static volatile SingularAttribute<Turno, String> fecha;
    public static volatile SingularAttribute<Turno, Paciente> pacien;
    public static volatile SingularAttribute<Turno, String> hora;
    public static volatile SingularAttribute<Turno, Integer> id_turno;
    public static volatile SingularAttribute<Turno, String> tratamiento;

}