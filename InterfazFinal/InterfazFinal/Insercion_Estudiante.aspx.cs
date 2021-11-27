using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Insercion_Estudiante : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Insercion_estudiante @Codigo ='" + codigo.Text + "', @dni ='" +
                dni.Text + "',@sexo ='" + sexo.Text + "',@direccion = '" + direccion.Text + "',@telefono ='" + telefono.Text +
                             "',@p_nombre = '" + nombre.Text + "',@apellido_p = '" + apellido_p.Text + "', @apellido_m ='" + apellido_m.Text +
                            "',@categoria ='" + catego.Text + "',@tipomatricula ='" + tipo_mat.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label11.Text = "Alumno Registrado con exito";
                con.Close();
                codigo.Text = "";
                dni.Text = "";
                sexo.Text = "";
                direccion.Text = "";
                telefono.Text = "";
                nombre.Text = "";
                apellido_p.Text = "";
                apellido_m.Text = "";
                catego.Text = "";
                tipo_mat.Text = "";
            }
            catch (Exception err)
            {
                Label11.Text = "Error al registrar alumno";
                Label11.Text += err.Message;
            }
        }
    }
}