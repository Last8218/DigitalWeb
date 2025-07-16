package service;

import dto.TrabajadorDTO;
import java.util.List;

public interface TrabajadorService {

    List<TrabajadorDTO> listTrabajador();
    
    List<TrabajadorDTO> listarTrabajadoresPorCliente(int idCliente);

    TrabajadorDTO buscarTrabajadorPorId(int idTrabajador);

    boolean insertarTrabajador(TrabajadorDTO trabajadorDto);

    boolean actualizarTrabajador(TrabajadorDTO trabajadorDto);
    
    TrabajadorDTO obtenerEmpresaTrabajador(int idUsuario) ;
    
}
