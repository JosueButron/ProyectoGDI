using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Interfaz
{
    public partial class Modificar_Estudiante : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
           "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string selectSQL = "exec sp_estudiante_actualiza_Telefono '" + TextBox1.Text +
                "','" + TextBox2.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Campo actualizado con exito";
                con.Close();
                TextBox1.Text = "";
                TextBox2.Text = "";

            }
            catch (Exception err)
            {
                Label1.Text = "Error al actualizado";
                Label1.Text += err.Message;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string selectSQL = "exec sp_estudiante_actualiza_Apellido_P '" + TextBox1.Text +
                "', '" + TextBox3.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label2.Text = "Campo actualizado con exito";
                con.Close();
                TextBox1.Text = "";
                TextBox3.Text = "";

            }
            catch (Exception err)
            {
                Label2.Text = "Error al actualizado";
                Label2.Text += err.Message;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string selectSQL = "EXEC sp_estudiante_actualiza_P_Nombre '" + TextBox1.Text +
                "','" + TextBox4.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label3.Text = "Campo actualizado con exito";
                con.Close();
                TextBox1.Text = "";
                TextBox4.Text = "";

            }
            catch (Exception err)
            {
                Label3.Text = "Error al actualizado";
                Label3.Text += err.Message;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string selectSQL = "exec sp_estudiante_actualiza_Apellido_M'" + TextBox1.Text +
                "', '" + TextBox5.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label4.Text = "Campo actualizado con exito";
                con.Close();
                TextBox1.Text = "";
                TextBox5.Text = "";

            }
            catch (Exception err)
            {
                Label4.Text = "Error al actualizarlo";
                Label4.Text += err.Message;
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string selectSQL = "exec sp_estudiante_actualiza_Direccion '" + TextBox1.Text +
                "', '" + TextBox6.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label5.Text = "Campo actualizado con exito";
                con.Close();
                TextBox1.Text = "";
                TextBox6.Text = "";

            }
            catch (Exception err)
            {
                Label5.Text = "Error al actualizado";
                Label5.Text += err.Message;
            }
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string selectSQL = "exec  sp_estudiante_actualiza_Tipo_Matricula '" + TextBox1.Text +
                "', '" + TextBox7.Text + "';";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label6.Text = "Campo actualizado con exito";
                con.Close();
                TextBox1.Text = "";
                TextBox7.Text = "";

            }
            catch (Exception err)
            {
                Label6.Text = "Error al actualizado";
                Label6.Text += err.Message;
            }
        }
        

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = Int32.Parse(RadioButtonList1.SelectedValue);
        }

        protected void Button7_Click1(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string selectSQL = "exec  sp_estudiante_actualiza_Categoria '" + TextBox1.Text +
                "','" + TextBox8.Text + "'";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(selectSQL, con);


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label7.Text = "Campo actualizado con exito";
                con.Close();
                TextBox1.Text = "";
                TextBox8.Text = "";

            }
            catch (Exception err)
            {
                Label7.Text = "Error al actualizar";
                Label7.Text += err.Message;
            }
        }
    }
}