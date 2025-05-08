package dao;


import com.last.digital.resources.config.ConnectionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Aplicacion;
import model.Solicitud;
import model.TipoSolicitud;
import model.Trabajador;

public class SolicitudDao {

    private Connection conn;

    public SolicitudDao() throws SQLException {
        conn = ConnectionDB.getConexion();
    }

    public boolean insertar(Solicitud solicitud) {
        String sql = "INSERT INTO solicitud (id_tipo_solicitud, motivo, fecha_registro, id_trabajador, id_aplicacion) VALUES ( ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            stmt.setInt(1, solicitud.getTipoSolicitud().getIdTipoSolicitud());
            stmt.setString(2, solicitud.getMotivo());
            stmt.setDate(3, new java.sql.Date(solicitud.getFechaRegistro().getTime()));
            stmt.setInt(4, solicitud.getTrabajador().getIdUsuario());
            stmt.setInt(5, solicitud.getAplicacion().getIdAplicacion());

            int filas = stmt.executeUpdate();

            if (filas > 0) {
                ResultSet rs = stmt.getGeneratedKeys();
                if (rs.next()) {
                    solicitud.setIdSolicitud(rs.getInt(1));
                }
                return true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Solicitud> listarTodos() {
        List<Solicitud> lista = new ArrayList<>();
        String sql = "SELECT * FROM solicitud";
        try (PreparedStatement stmt = conn.prepareStatement(sql); ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Solicitud solicitud = new Solicitud();
                solicitud.setIdSolicitud(rs.getInt("id_solicitud"));
                solicitud.setMotivo(rs.getString("motivo"));
                solicitud.setEstado(rs.getString("estado"));
                solicitud.setFechaRegistro(rs.getDate("fecha_registro"));
                solicitud.setFechaCierre(rs.getDate("fecha_cierre"));

                // Cargar Aplicacion
                Aplicacion app = new Aplicacion();
                AplicacionDao aplicacionDao = new AplicacionDao();
                app = aplicacionDao.buscarPorId(rs.getInt("id_aplicacion"));
                solicitud.setAplicacion(app);

                // Cargar TipoSolicitud
                TipoSolicitud tipo = new TipoSolicitud();
                TipoSolicitudDao tipoSolicitudDao = new TipoSolicitudDao();
                tipo = tipoSolicitudDao.buscarPorId(rs.getInt("id_tipo_solicitud"));
                solicitud.setTipoSolicitud(tipo);

                // Cargar Trabajador
                Trabajador trabajador = new Trabajador();
                TrabajadorDao trabajadorDao = new TrabajadorDao();
                trabajador = trabajadorDao.buscarPorIdUsuario(rs.getInt("id_trabajador"));
                solicitud.setTrabajador(trabajador);

                lista.add(solicitud);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Solicitud buscarPorId(int id) {
        String sql = "SELECT * FROM solicitud WHERE id_solicitud = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    Solicitud solicitud = new Solicitud();
                    solicitud.setIdSolicitud(rs.getInt("id_solicitud"));
                    solicitud.setMotivo(rs.getString("motivo"));
                    solicitud.setEstado(rs.getString("estado"));
                    solicitud.setFechaRegistro(rs.getDate("fecha_registro"));
                    solicitud.setFechaCierre(rs.getDate("fecha_cierre"));

                    // Cargar Aplicacion
                    Aplicacion app = new Aplicacion();
                    AplicacionDao aplicacionDao = new AplicacionDao();
                    app = aplicacionDao.buscarPorId(rs.getInt("id_aplicacion"));
                    solicitud.setAplicacion(app);

                    // Cargar TipoSolicitud
                    TipoSolicitud tipo = new TipoSolicitud();
                    TipoSolicitudDao tipoSolicitudDao = new TipoSolicitudDao();
                    tipo = tipoSolicitudDao.buscarPorId(rs.getInt("id_tipo_solicitud"));
                    solicitud.setTipoSolicitud(tipo);

                    // Cargar Trabajador
                    Trabajador trabajador = new Trabajador();
                    TrabajadorDao trabajadorDao = new TrabajadorDao();
                    trabajador = trabajadorDao.buscarPorIdUsuario(rs.getInt("id_trabajador"));
                    solicitud.setTrabajador(trabajador);

                    return solicitud;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean actualizar(Solicitud solicitud) {
        String sql = "UPDATE solicitud SET  id_tipo_solicitud = ?, motivo = ?, fecha_registro = ?, fecha_cierre = ?, estado = ?, id_aplicacion = ?, id_trabajador = ? WHERE id_solicitud = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, solicitud.getTipoSolicitud().getIdTipoSolicitud());
            stmt.setString(2, solicitud.getMotivo());
            stmt.setDate(3, new java.sql.Date(solicitud.getFechaRegistro().getTime()));
            stmt.setDate(4, new java.sql.Date(solicitud.getFechaCierre().getTime()));
            stmt.setString(5, solicitud.getEstado());
            stmt.setInt(6, solicitud.getAplicacion().getIdAplicacion());
            stmt.setInt(7, solicitud.getTrabajador().getIdUsuario());
            stmt.setInt(8, solicitud.getIdSolicitud());

            int filas = stmt.executeUpdate();
            return filas > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
