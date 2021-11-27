using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Eliminar_DetalleConsolidado_Completo : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_eliminacion_detalle_consolidado_completo '" + cod.Text + "'";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label11.Text = "Eliminación exitosa";
                con.Close();
                cod.Text = "";

            }
            catch (Exception err)
            {
                Label11.Text = "Error al eliminar Detalle Consolidado";
                Label11.Text += err.Message;
            }
        }
    }
}