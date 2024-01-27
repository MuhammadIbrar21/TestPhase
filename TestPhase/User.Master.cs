using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestPhase
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                btnlogout.Visible = true;
                btnLogin.Visible = false;
            }
            else
            {
                btnlogout.Visible = false;
                btnLogin.Visible = true;
                Response.Redirect("~/Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/SignIn.aspx");
        }

        protected void btnlogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
            Session["Username"] = null;
        }
    }
}