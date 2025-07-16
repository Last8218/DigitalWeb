
<!-- Sidebar vertical -->
<div id="sidebar">
    <h4><i class="bi bi-grid-1x2 me-2"></i>Menú</h4>
    <div class="accordion accordion-flush" id="accordionSidebar">

        <!-- Dashboard: solo para COLABORADOR ADMIN -->
        <c:if test="${sessionScope.tipoUsuario eq 'COLABORADOR' and sessionScope.rol=='admin'}">
            <div class="accordion-item">
                <div class="nav-link">
                    <a href="${pageContext.request.contextPath}/dashboard" class="nav-link">
                        <i class="bi bi-house"></i> Dashboard
                    </a>
                </div>
            </div>
        </c:if>

        <!-- Clientes -->
        <c:if test="${sessionScope.tipoUsuario eq 'COLABORADOR'}">
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#clientesCollapse">
                        <i class="bi bi-people me-2"></i> Clientes
                    </button>
                </h2>
                <div id="clientesCollapse" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <a href="${pageContext.request.contextPath}/cliente?accion=listar" class="nav-link">
                            <i class="bi bi-list-ul"></i> Listar todos
                        </a>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Solicitudes: accesible para todos -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#solicitudesCollapse">
                    <i class="bi bi-file-earmark-text me-2"></i> Solicitudes
                </button>
            </h2>
            <div id="solicitudesCollapse" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <a id="verTodasSolicitudes" href="${pageContext.request.contextPath}/solicitudes?accion=listarTodas" class="nav-link">
                        <i class="bi bi-card-list"></i> Ver todas
                    </a>
                    <c:if test="${sessionScope.tipoUsuario eq 'TRABAJADOR'}">
                        <button type="button" class="btn btn-primary" id="btnAbrirModalSolicitud">
                            <i class="bi bi-plus-circle"></i> Nueva solicitud
                        </button>
                    </c:if>
                </div>
            </div>
        </div>


        <!-- Aplicaciones sin restricciones -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#appsCollapse">
                    <i class="bi bi-app me-2"></i> Aplicaciones
                </button>
            </h2>
            <div id="appsCollapse" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/aplicacion?accion=listarTodas" class="nav-link">
                        <i class="bi bi-list-ul"></i> Listar todos
                    </a>
                </div>
            </div>
        </div>

        <!-- Usuarios -->
        <div class="accordion-item">
            <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#usuariosCollapse">
                    <i class="bi bi-app me-2"></i> Usuarios
                </button>
            </h2>
            <c:if test="${sessionScope.tipoUsuario eq 'COLABORADOR'}">
                <div id="usuariosCollapse" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <a href="${pageContext.request.contextPath}/colaborador?accion=listarTodos" class="nav-link">
                            <i class="bi bi-list-ul"></i> Colaboradores
                        </a>
                    </div>
                </div>
            </c:if>
            <div id="usuariosCollapse" class="accordion-collapse collapse">
                <div class="accordion-body">
                    <a href="${pageContext.request.contextPath}/trabajador?accion=listarTodos" class="nav-link">
                        <i class="bi bi-list-ul"></i> Trabajadores
                    </a>
                </div>
            </div>
        </div>

        <!-- Reportes -->
        <c:if test="${sessionScope.tipoUsuario eq 'COLABORADOR' and sessionScope.rol=='admin'}">
            <!-- Configuración -->
            <div class="accordion-item">
                <h2 class="accordion-header">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#configCollapse">
                        <i class="bi bi-gear me-2"></i> Configuración
                    </button>
                </h2>
                <div id="configCollapse" class="accordion-collapse collapse">
                    <div class="accordion-body">
                        <a href="#" class="nav-link">
                            <i class="bi bi-person-gear"></i> Usuarios
                        </a>
                    </div>
                </div>
            </div>
        </c:if>

    </div>
</div>