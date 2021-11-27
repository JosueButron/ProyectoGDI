<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Modificar_Docente.aspx.cs" Inherits="Interfaz.Modificar_Docente" %>

<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="Estilo.css">
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>CONSOLIDADO</title>
</head>
<body>
    <div class="sidebar close">
        <div class="logo-details">
            <img src="EscudoUCSM.png" alt="logo" width="73">
            <span class="logo_name">UCSM</span>
        </div>

        <ul class="nav-links">
            <li>
                <div class="iocn-link">
                    <a href="#">
                        <i class='bx bx-user'></i>
                        <span class="link_name">Estudiantes</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Estudiantes</a></li>
                    <li><a href="Estudiantes_Consulta.aspx">Consolidado de Notas</a></li>
                </ul>
            </li>

            <li>
                <div class="iocn-link">
                    <a href="#">
                        <i class='bx bx-grid-alt'></i>
                        <span class="link_name">Consultas</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Consultas</a></li>
                    <li><a href="Mostrar_Estudiante.aspx">Estudiante</a></li>
                    <li><a href="Mostrar_Asignatura.aspx">Asignatura</a></li>
                    <li><a href="Mostrar_Docente.aspx">Docente</a></li>
                    <li><a href="Mostrar_EscuelaProfesional.aspx">Escuela Profesional</a></li>
                    <li><a href="Mostrar_DetalleConsolidado.aspx">Detalle Consolidado</a></li>
                    <li><a href="Mostrar_CabeceraConsolidado.aspx">Cabecera Consolidado</a></li>
                    <li><a href="Mostrar_DetalleListado.aspx">Detalle Listado</a></li>
                    <li><a href="Mostrar_CabeceraListado.aspx">Cabecera Listado</a></li>
                    <li><a href="Mostrar_Inscribe.aspx">Inscribe</a></li>
                    <li><a href="Mostrar_ImpartidoPor.aspx">Impartido Por</a></li>
                    <li><a href="Mostrar_AlimentadoPor.aspx">Alimentado Por</a></li>
                </ul>
            </li>

            <li>
                <div class="iocn-link">
                    <a href="#">
                        <i class='bx bx-folder'></i>
                        <span class="link_name">Reportes</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Reportes</a></li>
                    <li><a href="Reporte_NotaFinalConsolidado.aspx">Nota Final Consolidado</a></li>
                    <li><a href="Reporte_ConsolidadoAplazados.aspx">Consolidado Aplazados</a></li>
                    <li><a href="Reporte_AsignaturaPorCodigoDocente.aspx">Asignatura por Docente</a></li>
                    <li><a href="Reporte_NumerosDocente.aspx">Numeros Docente</a></li>
                    <li><a href="Reporte_PromedioPporCodigo.aspx">Promedio Ponderado Cod</a></li>
                    <li><a href="Reporte_NotasPorAsignatura.aspx">Notas por Asignatura</a></li>
                    <li><a href="Reporte_PromedioPorAlumno.aspx">Promedio Alumno</a></li>
                    <li><a href="Reporte_EstudianteAsignatura.aspx">Estudiante en Asignatura</a></li>
                    <li><a href="Reporte_CantidadEstudianteCurAnt.aspx">Cantidad Estudiantes C.A.</a></li>
                </ul>
            </li>

            <li>
                <div class="iocn-link">
                    <a href="#">
                        <i class='bx bx-book-alt'></i>
                        <span class="link_name">Insertar</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Insertar</a></li>
                    <li><a href="Insercion_Estudiante.aspx">Estudiante</a></li>
                    <li><a href="Insercion_Asignatura.aspx">Asignatura</a></li>
                    <li><a href="Insercion_Docente.aspx">Docente</a></li>
                    <li><a href="Insercion_EscuelaProfesional.aspx">Escuela Profesional</a></li>
                    <li><a href="Insercion_DetalleConsolidado.aspx">Detalle Consolidado</a></li>
                    <li><a href="Insercion_CabeceraConsolidado.aspx">Cabecera Consolidado</a></li>
                    <li><a href="Insercion_DetalleListado.aspx">Detalle Listado</a></li>
                    <li><a href="Insercion_CabeceraListado.aspx">Cabecera Listado</a></li>
                    <li><a href="Insercion_Inscribe.aspx">Inscribe</a></li>
                    <li><a href="Insercion_ImpartidoPor.aspx">Impartido Por</a></li>
                    <li><a href="Insercion_AlimentadoPor.aspx">Alimentado Por</a></li>
                </ul>
            </li>

            <li>
                <div class="iocn-link">
                    <a href="#">
                        <i class='bx bx-cog'></i>
                        <span class="link_name">Modificar</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Modificar</a></li>
                    <li><a href="Modificar_Docente.aspx">Docente</a></li>
                    <li><a href="Modificar_Estudiante.aspx">Estudiante</a></li>
                </ul>
            </li>

            <li>
                <div class="iocn-link">
                    <a href="#">
                        <i class='bx bx-compass'></i>
                        <span class="link_name">Eliminar</span>
                    </a>
                    <i class='bx bxs-chevron-down arrow'></i>
                </div>
                <ul class="sub-menu">
                    <li><a class="link_name" href="#">Eliminar</a></li>
                    <li><a href="Eliminar_Estudiante.aspx">Estudiante</a></li>
                    <li><a href="Eliminar_Docente.aspx">Docente</a></li>
                    <li><a href="Eliminar_AlimentadoPor_Completo.aspx">Alimentado Por/C</a></li>
                    <li><a href="Eliminar_AlimentadoPor_Registro.aspx">Alimentado Por/R</a></li>
                    <li><a href="Eliminar_CabeceraConsolidado.aspx">Cabecera Consolidado</a></li>
                    <li><a href="Eliminar_CabeceraListado.aspx">Cabecera Listado</a></li>
                    <li><a href="Eliminar_DetalleConsolidado_Completo.aspx">Detalle Consolidado/C</a></li>
                    <li><a href="Eliminar_DetalleConsolidado_Registro.aspx">Detalle Consolidado/R</a></li>
                    <li><a href="Eliminar_DetalleListado.aspx">Detalle Listado</a></li>
                    <li><a href="Eliminar_ImpartidoPor.aspx">Impartido Por</a></li>
                    <li><a href="Eliminar_Inscribe.aspx">Inscribe</a></li>
                </ul>
            </li>

        </ul>
    </div>
    <section class="home-section">
        <div class="home-content">
            <i class='bx bx-menu'></i>
            <span class="text">MODIFICACIÓN</span>

        </div>
        <div class="home-section">
            <form id="form1" runat="server">
        <div>
            <br />
            Ingrese el Codigo de docente a actualizar:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Elija el campo a actualizar:<asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" RepeatDirection="Horizontal">
                <asp:ListItem Value="0">Telefono</asp:ListItem>
                <asp:ListItem Value="1">ApellidoP</asp:ListItem>
                <asp:ListItem Value="2">PNombre</asp:ListItem>
                <asp:ListItem Value="3">ApellidoM</asp:ListItem>
                <asp:ListItem Value="4">Direccion</asp:ListItem>
                <asp:ListItem Value="5">TipoDocente</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <br />
            <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
                <asp:View ID="View1" runat="server">
                    Ingrese el Telefono a actualizar:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Actualizar" />
                    <br />
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    Ingrese el Apellido Paterno a actualizar:<asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Actualizar" />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    Ingrese el Primer Nombre a actualizar:<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Actualizar" />
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    Ingrese el Apellido Materno a actualizar:<asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Actualizar" />
                    <br />
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </asp:View>
                <asp:View ID="View5" runat="server">
                    Ingrese la Direccion a actualizar:<asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Actualizar" />
                    <br />
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </asp:View>
                <asp:View ID="View6" runat="server">
                    Ingrese el Tipo de Docente a actualizar:<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                    <br />
                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Actualizar" />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                </asp:View>
            </asp:MultiView>
        </div>
    </form>
        </div>
    </section>
    <script>
        let arrow = document.querySelectorAll(".arrow");
        for (var i = 0; i < arrow.length; i++) {
            arrow[i].addEventListener("click", (e) => {
                let arrowParent = e.target.parentElement.parentElement;
                arrowParent.classList.toggle("showMenu");
            });
        }
        let sidebar = document.querySelector(".sidebar");
        let sidebarBtn = document.querySelector(".bx-menu");
        console.log(sidebarBtn);
        sidebarBtn.addEventListener("click", () => {
            sidebar.classList.toggle("close");
        });
    </script>
</body>
</html>
