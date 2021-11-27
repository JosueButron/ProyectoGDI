using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Insercion_ImpartidoPor : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Impartido_Por @Codigo_Asignatura = '" + cod_asi.Text + "', @Codigo_Docente ='" +
            cod_doc.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Registro impartido por Registrado con exito";
                con.Close();
                cod_asi.Text = "";
                cod_doc.Text = "";

            }
            catch (Exception err)
            {
                Label1.Text = "Error al registrar registro impartido por";
                Label1.Text += err.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
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

        protected void Button3_Click(object sender, EventArgs e)
        {
            string selectSQL = "exec sp_mostrar_docentte";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader dr;
            try
            {
                con.Open();
                dr = cmd.ExecuteReader();
                GridView3.DataSource = dr;
                GridView3.DataBind();
                con.Close();
            }
            catch (Exception err)
            {
                
            }
        }
    }
}