using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Insercion_Inscribe : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Inscribe @Codigo_Asignatura = '" + cod_asi.Text + "', @Codigo_Estudiante ='" +
            cod_alu.Text + "',@Vez ='" + vez.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Registro Inscribe Registrado con exito";
                con.Close();
                cod_asi.Text = "";
                cod_alu.Text = "";
                vez.Text = "";

            }
            catch (Exception err)
            {
                Label1.Text = "Error al registrar registro inscribe";
                Label1.Text += err.Message;
            }
        }
    }
}