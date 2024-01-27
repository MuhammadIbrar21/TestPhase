using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace TestPhase
{
    public partial class AddBrand : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddBrand_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into TileCompany (Name) values('" + txtBrand.Text + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Brand Added Successfully'); </script>");

                txtBrand.Text = string.Empty;
                con.Close();
                txtBrand.Focus();
            }
        }
    }
}