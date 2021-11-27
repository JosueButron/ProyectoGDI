﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace InterfazConsolidado
{
    public partial class Eliminar_Inscribe : System.Web.UI.Page
    {
        string connectionString2 = "Data Source=DESKTOP-B8FPQCU;" +
            "Initial Catalog=DB_Consolidado; Integrated Security=SSPI";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!this.IsValid) return;
            string insertSQL = "exec sp_Elimina_Inscribe_2 '" + TextBox1.Text + "','" + TextBox2.Text + "'";
            SqlConnection con = new SqlConnection(connectionString2);
            SqlCommand cmd = new SqlCommand(insertSQL, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                Label1.Text = "Registro Inscribe eliminado con exito";
                con.Close();
                TextBox1.Text = "";

            }
            catch (Exception err)
            {
                Label1.Text = "Error al eliminar Registro Inscribe";
                Label1.Text += err.Message;
            }
        }
    }
}