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
    public partial class ProductView : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null)
            {
                if (!IsPostBack)
                {
                    BindProductDetails();
                }
            }
            else
            {
                Response.Redirect("~/Products.aspx");
            }
        }

        private void BindProductDetails()
        {
            Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
            using (SqlConnection con = new SqlConnection(CS))
            {
                using (SqlCommand cmd = new SqlCommand("select * from tblProducts where PID = '" + PID + "'", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        rptrProductDetails.DataSource = dt;
                        rptrProductDetails.DataBind();
                    }
                }
            }
        }

        protected void rptrProductDetails_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                string BrandID = (e.Item.FindControl("hfBrandID") as HiddenField).Value;
                string CatID = (e.Item.FindControl("hfCatID") as HiddenField).Value;

                RadioButtonList rblSize = e.Item.FindControl("rblSize") as RadioButtonList;

                Int64 PID = Convert.ToInt64(Request.QueryString["PID"]);
                using (SqlConnection con = new SqlConnection(CS))
                {
                    using (SqlCommand cmd = new SqlCommand("select * from tblSizes where BrandID = '" + BrandID + "' and CategoryID = " + CatID + "", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            rblSize.DataSource = dt;
                            rblSize.DataTextField = "sizename";
                            rblSize.DataValueField = "sizeid";
                            rblSize.DataBind();
                        }
                    }
                }
            }
        }
    }
}