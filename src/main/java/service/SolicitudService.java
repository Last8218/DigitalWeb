package service;

import dto.SolicitudDTO;
import java.util.List;

public interface SolicitudService {

    List<SolicitudDTO> listSolicitud();
    
    List<SolicitudDTO> listSolicitudesPorEstado(String estado);
    
    List<SolicitudDTO> listSolicitudesPorTipo(int tipoSolicitud);
    
    List<SolicitudDTO> listSolicitudesPorTrabajador(int idTrabajador);
    
    List<SolicitudDTO> listSolicitudesPorAplicacion(int idAplicacion);
    
    List<SolicitudDTO> listaSolicitudesPorCliente(int idAplicacion);
    
    List<SolicitudDTO> listarSolicitudesAsignadasPorColaborador (int idColaborador);

    SolicitudDTO buscarSolicitudPorId(int idSolicitud);

    boolean insertarSolicitud(SolicitudDTO solicitudDto);

    boolean actualizarSolicitud(SolicitudDTO solicitudDto);
    
    
    
}
