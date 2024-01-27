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
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into Tile (CatName) values('" + txtCategory.Text + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Category Added Successfully'); </script>");

                txtCategory.Text = string.Empty;
                con.Close();
                txtCategory.Focus();
            }
        }
    }
}