package Controller;

import dto.ClienteDTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import service.AplicacionService;
import service.ClienteService;
import service.SolicitudService;
import serviceImpl.AplicacionServiceImpl;
import serviceImpl.ClienteServiceImpl;
import serviceImpl.SolicitudServiceImpl;

@WebServlet("/Digital")
public class MenuPrincipalController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private ClienteService clienteService;
    private AplicacionService aplicacionService;
    private SolicitudService solicitudService;

    @Override
    public void init() throws ServletException {
        this.clienteService = new ClienteServiceImpl();
        this.aplicacionService = new AplicacionServiceImpl();
        this.solicitudService = new SolicitudServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Cargar todos los datos para el dashboard
        cargarDatosDashboard(request);

        // Redirigir al index.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    private void cargarDatosDashboard(HttpServletRequest request) {
        try {
            // Obtener estadísticas de clientes
            obtenerEstadisticasClientes(request);

            // Obtener estadísticas de aplicaciones
            /*obtenerEstadisticasAplicaciones(request);

            // Obtener estadísticas de solicitudes
            obtenerEstadisticasSolicitudes(request);

            // Obtener solicitudes pendientes
            obtenerSolicitudesPendientes(request);

            // Obtener últimas solicitudes para la tabla
            obtenerUltimasSolicitudes(request); */

        } catch (Exception e) {
            // Manejo de errores
            request.setAttribute("error", "Error al cargar datos del dashboard: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
       private void obtenerEstadisticasClientes(HttpServletRequest request) {
        // Obtener número total de clientes
        List<ClienteDTO> clientes = clienteService.listar();
        int numeroClientes = clientes.size();
        request.setAttribute("numeroClientes", numeroClientes);
        
        // Calcular porcentaje de cambio (ejemplo: clientes nuevos este mes)
        //int clientesNuevosMes = clienteService.listar();
        //double porcentajeCrecimiento = 0;
        //if (numeroClientes > 0) {
        //    porcentajeCrecimiento = (double) clientesNuevosMes / numeroClientes * 100;
        //}
        //request.setAttribute("porcentajeCrecimientoClientes", porcentajeCrecimiento);
        //request.setAttribute("clientesNuevosMes", clientesNuevosMes);
    }

}
