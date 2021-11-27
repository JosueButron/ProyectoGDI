using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Insercion_Docente : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Insercion_Docentes @Codigo = '" + codigo.Text + "', @dni ='" +
            dni.Text + "',@Telefono ='" + telefono.Text + "',@Apellido_p = '" + apellidop.Text + "',@P_Nombre ='" + nombre.Text +
            "',@Apellido_M = '" + apellidom.Text + "',@Sexo = '" + sexo.Text + "', @Direccion ='" + direccion.Text +
            "',@Tipo ='" + tipo.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Docente Registrado con exito";
                con.Close();
                codigo.Text = "";
                dni.Text = "";
                telefono.Text = "";
                apellidop.Text = "";
                nombre.Text = "";
                apellidom.Text = "";
                sexo.Text = "";
                direccion.Text = "";
                tipo.Text = "";



            }
            catch (Exception err)
            {
                Label1.Text = "Error al registrar docente";
                Label1.Text += err.Message;
            }
        }
    }
}