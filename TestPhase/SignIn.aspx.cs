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
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblUsers where Username=@username and Password=@pwd", con);
                cmd.Parameters.AddWithValue("@username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@pwd", txtPass.Text);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    string Utype;
                    Utype = dt.Rows[0][5].ToString().Trim();
                    if (Utype == "User")
                    {
                        Session["Username"] = txtUsername.Text;
                        Response.Redirect("~/UserHome.aspx");
                    }
                    if (Utype == "Admin")
                    {
                        Session["Username"] = txtUsername.Text;
                        Response.Redirect("~/AdminHome.aspx");
                    }
                }
                else
                {
                    lblError.Text = "Invalid Username and Password";
                }
                clr();
                con.Close();
            }
        }

        private void clr()
        {
            txtPass.Text = string.Empty;
            txtUsername.Text = string.Empty;
            txtUsername.Focus();
        }
    }
}