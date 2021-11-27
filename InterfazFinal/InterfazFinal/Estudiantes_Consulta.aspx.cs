using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Interfaz
{
    public partial class Estudiantes_Consulta : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void Button6_Click(object sender, EventArgs e)
        {
            string selectSQL = "exec sp_estudiante_nombre @codigo = '" + codigoestu.Text + "'";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);
            SqlDataReader dr1;
            try
            {
                con.Open();
                dr1 = cmd.ExecuteReader();
                if (dr1.Read())
                {
                    Label18.Text = dr1[0].ToString() + " ";
                    Label18.Text += dr1[1].ToString() + " ";
                    Label18.Text += dr1[2].ToString();

                }
                con.Close();
                dr1.Close();
            }
            catch (Exception err)
            {
            }

            string selectSQL1 = "exec sp_Escuela_profesional @codigo ='" + codigoestu.Text + "'";
            SqlConnection con1 = new SqlConnection(connectionString2);
            SqlCommand cmd1 = new SqlCommand(selectSQL1, con1);
            SqlDataReader dr2;
            try
            {
                con1.Open();
                dr2 = cmd1.ExecuteReader();
                if (dr2.Read())
                {
                    Label15.Text = dr2[0].ToString();
                    Label16.Text = dr2[1].ToString();
                }
                con1.Close();
                dr2.Close();
            }
            catch (Exception err)
            {
            }
            Label17.Text = codigoestu.Text;

            string selectSQL2 = "exec sp_tipo_matricula @codigo ='" + codigoestu.Text + "'";
            SqlConnection con2 = new SqlConnection(connectionString2);
            SqlCommand cmd2 = new SqlCommand(selectSQL2, con2);
            SqlDataReader dr3;
            try
            {
                con2.Open();
                dr3 = cmd2.ExecuteReader();
                if (dr3.Read())
                {
                    Label20.Text = dr3[0].ToString();
                }
                con2.Close();
                dr3.Close();
            }
            catch (Exception err)
            {
            }

            string selectSQL3 = "exec sp_total_Creditos @codigo ='" + codigoestu.Text + "'";
            SqlConnection con3 = new SqlConnection(connectionString2);
            SqlCommand cmd3 = new SqlCommand(selectSQL3, con3);
            SqlDataReader dr4;
            try
            {
                con3.Open();
                dr4 = cmd3.ExecuteReader();
                if (dr4.Read())
                {
                    Label21.Text = dr4[0].ToString();
                }
                con3.Close();
                dr4.Close();
            }
            catch (Exception err)
            {
            }

            string selectSQL4 = "exec sp_semestre_academico @codigo ='" + codigoestu.Text + "'";
            SqlConnection con4 = new SqlConnection(connectionString2);
            SqlCommand cmd4 = new SqlCommand(selectSQL4, con4);
            SqlDataReader dr5;
            try
            {
                con4.Open();
                dr5 = cmd4.ExecuteReader();
                if (dr5.Read())
                {
                    Label22.Text = dr5[0].ToString();
                }
                con4.Close();
                dr5.Close();
            }
            catch (Exception err)
            {
            }

            string selectSQL5 = "exec sp_semestre_base @codigo ='" + codigoestu.Text + "'";
            SqlConnection con5 = new SqlConnection(connectionString2);
            SqlCommand cmd5 = new SqlCommand(selectSQL5, con5);
            SqlDataReader dr6;
            try
            {
                con5.Open();
                dr6 = cmd5.ExecuteReader();
                if (dr6.Read())
                {
                    Label23.Text = dr6[0].ToString();
                }
                con5.Close();
                dr6.Close();
            }
            catch (Exception err)
            {
            }

            string selectSQL6 = "exec sp_categoria @codigo ='" + codigoestu.Text + "'";
            SqlConnection con6 = new SqlConnection(connectionString2);
            SqlCommand cmd6 = new SqlCommand(selectSQL6, con6);
            SqlDataReader dr7;
            try
            {
                con6.Open();
                dr7 = cmd6.ExecuteReader();
                if (dr7.Read())
                {
                    Label19.Text = dr7[0].ToString();
                }
                con6.Close();
                dr7.Close();
            }
            catch (Exception err)
            {
            }
            string selectSQL7 = "exec sp_Mostrar_Estudiante_Detalle " + "'" + codigoestu.Text + "';";
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