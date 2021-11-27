using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazFinal
{
    public partial class Reporte_CantidadEstudianteCurAnt : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {
            string selectSQL = "exec sp_Obtener_Cantidad_Estudiantes_Curricula_Anterior_ ";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader dr1;
            try
            {
                con.Open();
                dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    Label1.Text = dr1[0].ToString() + " ";
                    

                }
                con.Close();
                dr1.Close();
            }
            catch (Exception err)
            {
            }
        }
    }
}