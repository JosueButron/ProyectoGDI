using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazFinal
{
    public partial class Reporte_EstudianteAsignatura : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string selectSQL7 = "exec sp_estudiantes_asignatura '" + TextBox1.Text + "';";
            SqlConnection con7 = new SqlConnection(connectionString2);
            SqlCommand cmd7 = new SqlCommand(selectSQL7, con7);
            SqlDataReader dr8;
            try
            {
                con7.Open();
                dr8 = cmd7.ExecuteReader();
                GridView1.DataSource = dr8;
                GridView1.DataBind();
                con7.Close();
            }
            catch (Exception err)
            {

            }
        }
    }
}