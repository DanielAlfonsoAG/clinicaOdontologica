/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package logica;

import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import persistencia.ControladoraPersistencia;
/**
 *
 * @author agude
 */
public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();
    
    public List<Usuario> getUsuario() {
        return controlPersis.getUsuario();
    }
    public List<Horario> getHorario() {
        return controlPersis.getHorario();
    }
    public List<Responsable> getResponsable() {
        return controlPersis.getResponsable();
    }
    public List<Odontologo> getOdontologos() {
        return controlPersis.getOdontologos();
    }
    public List<Paciente> getPacientes() {
        return controlPersis.getPacientes();
    }
    public List<Turno> getTurno() {
        return controlPersis.getTurno();
    }
      public List<Secretario> getSecretario() {
        return  controlPersis.getSecretario();
    }
      
    public List<Turno> listaTurnosHoy(int idUsu, String fActual){
        return controlPersis.listaTurnosHoy(idUsu,fActual);
    }  

    public void crearUsuario(String nombreUsuario, String contrasenia, String rol) {
       Usuario usu = new Usuario();
       usu.setNombreusuario(nombreUsuario);
       usu.setContrasenia(contrasenia);
       usu.setRol(rol);
       controlPersis.crearUsuario(usu);
    }
    public void borrarUsuario(int id){
    controlPersis.borrarUsuario(id);
    }
    
    public void editarUsuario(Usuario usu) {
        controlPersis.editarUsuario(usu);
    }

    public boolean comprobarAcceso(String usuario, String contrasenia) {
       List<Usuario> listaUsuario = new ArrayList<Usuario>();
       listaUsuario = controlPersis.getUsuario();
        for (Usuario usu:listaUsuario) {
            if (usu.getNombreusuario().equals(usuario)) {
                if (desencriptarpassword(usu.getContrasenia()).equals(contrasenia)) {
                    return true;
                }
            }
        }
        return false;
    }
    public String comprobarRol(String usuario, String contrasenia) {
       List<Usuario> listaUsuario = new ArrayList<Usuario>();
       listaUsuario = controlPersis.getUsuario();
        for (Usuario usu:listaUsuario) {
            if (usu.getNombreusuario().equals(usuario)) {
                if (desencriptarpassword(usu.getContrasenia()).equals(contrasenia)) {
                    return usu.getRol();
                }
            }
        }
        return "";
    }

    public void crearPaciente(String dni, String nombre, String apellidos, String telefono, String direccion, String fechanac, String tiposangre, boolean eps, Responsable res) {
        Paciente pac = new Paciente();
        pac.setDni(dni);
        pac.setNombre(nombre);
        pac.setApellidos(apellidos);
        pac.setTelefono(telefono);
        pac.setDireccion(direccion);
        pac.setFecha_nac(fechanac);
        pac.setTipo_sangre(tiposangre);
        pac.setEps(eps);
        pac.setUnResponsable(res);
        
        controlPersis.crearPaciente(pac);
    }

    public void crearTurno(String fecha, String hora, String tratamiento, Odontologo odont, Paciente pacien) {
     Turno Tur = new Turno();
        Tur.setFecha(fecha);
        Tur.setHora(hora);
        Tur.setTratamiento(tratamiento);
        Tur.setOdonto(odont);
        Tur.setPacien(pacien);

        controlPersis.crearTurno(Tur);   
    }
    
    public void crearOdontologo(String dni, String nombre, String apellidos, String telefono, String direccion, String fechanac, String especialidad, Horario horario, Usuario usuario) {
        Odontologo odon = new Odontologo();
        odon.setDni(dni);
        odon.setNombre(nombre);
        odon.setApellidos(apellidos);
        odon.setTelefono(telefono);
        odon.setDireccion(direccion);
        odon.setFecha_nac(fechanac);
        odon.setEspecialidad(especialidad);
        odon.setUnHorario(horario);
        odon.setUnUsuario(usuario);
        
        
        controlPersis.crearOdontologo(odon);
    }
    
    public void crearHorario(String horario_ini, String horario_fin) {
        Horario hor = new Horario();
        hor.setHorario_inicio(horario_ini);
        hor.setHorario_fin(horario_fin);
        
        controlPersis.crearHorario(hor);
    }
    
    public void crearResponsable(String dni, String nombre, String apellidos, String telefono, String direccion, String fechanac, String tipo_responsable) {
        Responsable Res = new Responsable();
        Res.setDni(dni);
        Res.setNombre(nombre);
        Res.setApellidos(apellidos);
        Res.setTelefono(telefono);
        Res.setDireccion(direccion);
        Res.setFecha_nac(fechanac);
        Res.setTipo_responsable(tipo_responsable);

        controlPersis.crearResponsable(Res);
    }
    
    public void crearSectretario(String dni, String nombre, String apellidos, String telefono, String direccion, String fechanac, String Sector, Usuario usuario) {
         Secretario sec = new Secretario();
        sec.setDni(dni);
        sec.setNombre(nombre);
        sec.setApellidos(apellidos);
        sec.setTelefono(telefono);
        sec.setDireccion(direccion);
        sec.setFecha_nac(fechanac);
        sec.setSector(Sector);
        sec.setUnUsuario(usuario);
        
        controlPersis.crearSectretario(sec);
    }
    
    public Usuario traerUsuario(int id) {
        return controlPersis.traerUsuario(id); 
    }
    public Responsable traerResponsable(int id_responsable) {
        return controlPersis.traerResponsable(id_responsable);
    }
    public Odontologo traerOdontologo(int idOdonto) {
        return controlPersis.traerOdontologo(idOdonto);
    }
    public Paciente traerPaciente(int idPacien) {
        return controlPersis.traerPaciente(idPacien);
    }
    public Horario traerHorario(int idHorario) {
       return controlPersis.traerHorario(idHorario);
    }
    public Turno traerTurno(int idTurnos) {
        return controlPersis.traerTurno(idTurnos);
    }
    public Secretario traerSecretario(int id) {
        return controlPersis.traerSecretario(id);
    }

    public void editarOdontologo(Odontologo odont) {
        controlPersis.editarOdontologo(odont);
    }

    public void borrarOdontologo(int id) {
        controlPersis.borrarOdontologo(id);
    }

    public void editarPaciente(Paciente pacien) {
        controlPersis.editarPaciente(pacien);
    }

    public void borrarPaciente(int id) {
        controlPersis.borrarPaciente(id);
    }

    public void borrarTurno(int id) {
        controlPersis.borrarTurno(id);
    }
    
    public void editarTurno(Turno turn) {
        controlPersis.editarTurno(turn);
    }
    
    public void editarResponsable(Responsable resp) {
        controlPersis.editarResponsable(resp);
    }

    public void borrarResponsable(int id) {
        controlPersis.borrarResponsable(id);
    }

    public void editarHorario(Horario hor) {
        controlPersis.editarHorario(hor);
    }

    public void borrarHorario(int id) {
        controlPersis.borrarHorario(id);
    }

    public void editarSecretario(Secretario secre) {
        controlPersis.editarSecretario(secre);
    }

    public void borrarSecretario(int id) {
        controlPersis.borrarSecretario(id);
    }

    public int comprobarId(String usuario, String contrasenia) {
        List<Usuario> listaUsuario = new ArrayList<Usuario>();
       listaUsuario = controlPersis.getUsuario();
        for (Usuario usu:listaUsuario) {
            if (usu.getNombreusuario().equals(usuario)) {
                if (desencriptarpassword(usu.getContrasenia()).equals(contrasenia)) {
                    return usu.getId_usuario();
                }
            }
        }
        return 0;
    }

    public List<Turno> miTurno(int idUsu) {
        List<Turno> listaTurnos = new ArrayList<Turno>();
        List<Turno> listaAllTurnos = controlPersis.getTurno();
        for (Turno tur:listaAllTurnos) {
            if (tur.getOdonto().getUnUsuario().getId_usuario()== idUsu ) {
                    listaTurnos.add(tur);
            }
        }
        return listaTurnos;
    }

    private Object desencriptarpassword(String contrasenia) {
        byte[] arregloByteDecodificado = Base64.getDecoder().decode(contrasenia);
        String textoDecodificado = new String(arregloByteDecodificado);
        return textoDecodificado;
    }
    
}
