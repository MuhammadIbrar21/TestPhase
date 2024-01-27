using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;
using System.Threading;

namespace TestPhase
{
    public partial class TileCompany : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] != null)
            {
                if (!IsPostBack)
                {
                    BindProductRepeater();

                }
            }
            else
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        private void BindProductRepeater()
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("procBindAllProducts2", con))
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

        protected void txtFilterGrid1Record_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(CS);
            con.Open();
            string qr = "select A.*,B.* ,B.Name as BrandName from tblProducts A inner join TileCompany B on B.BrandID =A.PBrandID inner join Tile as t2 on t2.CatID=A.PCategoryID B where t2.CatName='Marble' or t2.CatName='Glass' AND A.PName like '" + txtFilterGrid1Record.Text + "%' order by A.PID desc";
            SqlDataAdapter da = new SqlDataAdapter(qr, con);
            string text = ((TextBox)sender).Text;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptrProducts.DataSource = ds.Tables[0];
                rptrProducts.DataBind();
            }
        }
    }
}