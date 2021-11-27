using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Insercion_DetalleConsolidado : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Insercion_Detalle_Consolidado @Codigo_Asignatura ='" + codigoasig.Text + "', @Codigo_Estudiante ='" +
            codigoestu.Text + "',@TEO_N1 ='" + teo1.Text + "',@TEO_N2 = '" + teo2.Text + "',@TEO_N3 ='" + teo3.Text +
            "',@PRA_N1 = '" + prac1.Text + "',@PRA_N2 = '" + prac2.Text + "', @PRA_N3 ='" + prac3.Text +
            "',@P_PRA ='" + promprac.Text + "',@P_PAR ='" + prompar.Text + "',@APL ='" + apl.Text + "',@P_Final ='" + promfinal.Text + "';";

            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label11.Text = "Detalle de Consolidado Registrado con exito";
                con.Close();
                codigoasig.Text = "";
                codigoestu.Text = "";
                teo1.Text = "";
                teo2.Text = "";
                teo3.Text = "";
                prac1.Text = "";
                prac2.Text = "";
                prac3.Text = "";
                promprac.Text = "";
                prompar.Text = "";
                apl.Text = "";
                promfinal.Text = "";
            }
            catch (Exception err)
            {
                Label11.Text = "Error al registrar Detalle del consolidado";
                Label11.Text += err.Message;
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
            string selectSQL = "exec sp_mostrar_estudiante";
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