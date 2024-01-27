using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.HtmlControls;

namespace TestPhase
{
    public partial class Products : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlLink link = Page.Master.FindControl("layoutStyleSheet") as HtmlLink; link.Href = "css/Custome.css";
            
            if (!IsPostBack)
            {
                BindProductReapter();
            }
        }

        private void BindProductReapter()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("procBindAllProducts", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProducts.DataSource = dt;
                        rptrProducts.DataBind();
                    }
                }
            }
        }
    }
}