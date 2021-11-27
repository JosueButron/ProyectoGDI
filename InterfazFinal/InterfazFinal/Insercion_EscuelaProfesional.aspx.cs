using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Insercion_EscuelaProfesional : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Insercion_Escuela_Profesional_fin  '" + codigo.Text + "', '" +escuela_prof.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Escuela Profesional Registrado con exito";
                con.Close();
                codigo.Text = "";
                escuela_prof.Text = "";

            }
            catch (Exception err)
            {
                Label1.Text = "Error al registrar Escuela Profesional";
                Label1.Text += err.Message;
            }
        }
    }
}