/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package persistencia;

import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;
import logica.Horario;
import logica.Odontologo;
import logica.Paciente;
import logica.Responsable;
import logica.Secretario;
import logica.Turno;
import logica.Usuario;
import persistencia.exceptions.NonexistentEntityException;

/**
 *
 * @author agude
 */
public class ControladoraPersistencia {
    HorarioJpaController horaJPA = new HorarioJpaController();
    OdontologoJpaController odontoJPA = new OdontologoJpaController();
    PacienteJpaController pacJPA = new PacienteJpaController();
    PersonaJpaController persJPA = new PersonaJpaController();
    ResponsableJpaController respJPA = new ResponsableJpaController();
    SecretarioJpaController secreJPA = new SecretarioJpaController();
    TurnoJpaController turnJPA = new TurnoJpaController();
    UsuarioJpaController usuJPA = new UsuarioJpaController();

    public List<Usuario> getUsuario() {
        return usuJPA.findUsuarioEntities();
    }
    public List<Responsable> getResponsable() {
        return respJPA.findResponsableEntities();
    }
    public List<Paciente> getPacientes() {
       return pacJPA.findPacienteEntities();
    }
    public List<Odontologo> getOdontologos() {
        return odontoJPA.findOdontologoEntities();
    }
    public List<Turno> getTurno() {
        return turnJPA.findTurnoEntities();
    }
    public List<Horario> getHorario() {
        return horaJPA.findHorarioEntities();
    }    
    public List<Secretario> getSecretario() {
        return secreJPA.findSecretarioEntities();
    }
    
    public void crearPaciente(Paciente pac) {
       pacJPA.create(pac);
    }
    public void crearTurno(Turno Tur) {
       turnJPA.create(Tur);
    }
    public void crearOdontologo(Odontologo odon) {
        odontoJPA.create(odon);
    }
    public void crearHorario(Horario hor) {
        horaJPA.create(hor);
    }
    public void crearResponsable(Responsable Res) {
       respJPA.create(Res);
    }
    public void crearSectretario(Secretario sec) {
       secreJPA.create(sec);
    }
    
    public void crearUsuario(Usuario usu) {
       Usuario usuarioExistente = findUsuarios(usu.getNombreusuario());
        
        if (usuarioExistente == null) {
            String tmp = encriptarpassword(usu.getContrasenia());
            usu.setContrasenia(tmp);

            usuJPA.create(usu);
        
    }
        // Si el usuario ya existe, no lo creamos
        System.out.println("El usuario con el nombre '" + usu.getNombreusuario()+ "' ya existe."); 
    }
    
    public void editarUsuario(Usuario usu) {
        try {
            String tmp = encriptarpassword(usu.getContrasenia());
        usu.setContrasenia(tmp);
            usuJPA.edit(usu);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex );
        }
    }
    public void borrarUsuario(int id) {
        try {
            usuJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex );
        }
    }     
    
    public Responsable traerResponsable(int id_responsable) {
       return respJPA.findResponsable(id_responsable);
    }
    public Odontologo traerOdontologo(int idOdonto) {
       return odontoJPA.findOdontologo(idOdonto);
    }
    public Usuario traerUsuario(int id) {
        Usuario usuEnviar= usuJPA.findUsuario(id);
        String tmp = desencriptarpassword(usuEnviar.getContrasenia());
        usuEnviar.setContrasenia(tmp);
        return usuEnviar;
    }
    public Paciente traerPaciente(int idPacien) {
        return pacJPA.findPaciente(idPacien);
    }   
    public Horario traerHorario(int idHorario) {
       return horaJPA.findHorario(idHorario);
    }
    public Turno traerTurno(int idTurnos) {
        return turnJPA.findTurno(idTurnos);
    }
    public Secretario traerSecretario(int id) {
        return secreJPA.findSecretario(id);
    }

    public void editarOdontologo(Odontologo odont) {
        try {
            odontoJPA.edit(odont);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarOdontologo(int id) {
        try {
            odontoJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarPaciente(Paciente pacien) {
        try {
            pacJPA.edit(pacien);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarPaciente(int id) {
        try {
            pacJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void editarTurno(Turno turn) {
        try {
            turnJPA.edit(turn);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public void borrarTurno(int id) {
        try {
            turnJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarResponsable(Responsable resp) {
        try {
            respJPA.edit(resp);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarResponsable(int id) {
        try {
            respJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarHorario(Horario hor) {
        try {
            horaJPA.edit(hor);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarHorario(int id) {
        try {
            horaJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void editarSecretario(Secretario secre) {
        try {
            secreJPA.edit(secre);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void borrarSecretario(int id) {
        try {
            secreJPA.destroy(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> listaTurnosHoy(int idUsu, String fActual) {

        EntityManager em = turnJPA.getEntityManager();
        String fechaBuscar = fActual.substring(0, 10); // Obtiene solo la fecha en formato "yyyy-MM-dd"
        
        Query query = em.createQuery("SELECT t FROM Turno t WHERE t.fecha LIKE :fechaBuscar AND t.odonto.unUsuario.id_usuario = :idUsu ORDER BY t.fecha");
        query.setParameter("fechaBuscar", fechaBuscar + "%");
        query.setParameter("idUsu", idUsu);
        
        List<Turno> lista= query.getResultList();
        return lista;
    }

    private Usuario findUsuarios(String nombreusuario) {
        EntityManager em = usuJPA.getEntityManager();
        // Consulta para encontrar un usuario por nombre
        Query query = em.createQuery("SELECT u FROM Usuario u WHERE u.nombreusuario = :nombreusuario");
        query.setParameter("nombreusuario", nombreusuario);

        try {
            return (Usuario) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        }
    }

    private String encriptarpassword(String contrasenia) {
        String codigo = Base64.getEncoder().encodeToString(contrasenia.getBytes());
       return codigo;
    }

    private String desencriptarpassword(String contrasenia) {
        byte[] arregloByteDecodificado = Base64.getDecoder().decode(contrasenia);
        String textoDecodificado = new String(arregloByteDecodificado);
        return textoDecodificado;
    }

}
