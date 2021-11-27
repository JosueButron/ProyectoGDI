using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Insercion_CabeceraConsolidado : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Insercion_Cabecera_Consolidado @Codigo_Estudiante = '" + cod_es.Text + "', @Codigo_EP ='" +
            cod_ep.Text + "',@Semestre_Base ='" + semestreb.Text + "',@Semestre_Acad = '" + semestreaca.Text + "',@Tot_Creditos ='" + total_cre.Text +
            "',@Pond_General = '" + pond_general.Text + "',@Pond_Semestre = '" + pond_sem.Text + "', @Ord_Merito ='" + orden.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Cabecera Consolidado con exito";
                con.Close();
                cod_es.Text = "";
                cod_ep.Text = "";
                semestreb.Text = "";
                semestreaca.Text = "";
                total_cre.Text = "";
                pond_general.Text = "";
                pond_sem.Text = "";
                orden.Text = "";


            }
            catch (Exception err)
            {
                Label1.Text = "Error al registrar Cabecera Consolidado";
                Label1.Text += err.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string selectSQL = "exec sp_mostrar_estudiante";
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
            string selectSQL = "exec Mostrar_Todo_Escuela_Profesional";
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