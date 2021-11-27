using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Insercion_CabeceraListado : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Insercion_Cabecera_Listado @Codigo_Docente ='" + coddoce.Text + "', @Codigo_Asignatura ='" +
            codasig.Text + "',@Semestre ='" + semestre.Text + "';";

            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Detalle de Consolidado Cabecera Listado con exito";
                con.Close();
                coddoce.Text = "";
                codasig.Text = "";
                semestre.Text = "";

            }
            catch (Exception err)
            {
                Label1.Text = "Error al registrar Detalle del Cabecera Listado";
                Label1.Text += err.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string selectSQL = "exec sp_mostrar_docentte";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader dr;
            try
            {
                con.Open();
                dr = cmd.ExecuteReader();
                GridView1.DataSource = dr;
                GridView1.DataBind();
                con.Close();
            }
            catch (Exception err)
            {

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string selectSQL = "exec sp_mostrar_Asignaturaa";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader dr;
            try
            {
                con.Open();
                dr = cmd.ExecuteReader();
                GridView2.DataSource = dr;
                GridView2.DataBind();
                con.Close();
            }
            catch (Exception err)
            {

            }
        }
    }
}