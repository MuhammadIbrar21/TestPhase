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
    public partial class EditSize : System.Web.UI.Page
    {
        string BrandID = "";
        string SizeName = "";
        string MainCID = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                if (!IsPostBack)
                {
                    BindGridview();
                }
            }
            else
            {
                Response.Redirect("SignIn.aspx");
            }
        }

        private void BindGridview()
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlDataAdapter da = new SqlDataAdapter("select t1.SizeID,t1.SizeName,t2.Name as Brand,t3.CatName as Category from tblSizes as t1 with(nolock) inner join TileCompany as t2 with(nolock) on t2.BrandID=t1.BrandID inner join Tile as t3 with(nolock) on t3.CatID=t1.CategoryID", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            con.Close();
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                GridView1.DataSource = null;
                GridView1.DataBind();
            }
        }

        protected void txtID_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString);
            if (con.State == ConnectionState.Closed) { con.Open(); }
            SqlCommand cmd = new SqlCommand("select SizeName,BrandID,CategoryID from tblSizes where SizeID=@ID", con);
            cmd.Parameters.AddWithValue("@ID", Convert.ToInt32(txtID.Text));
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();
            da.Fill(ds, "dt");
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                BrandID = ds.Tables[0].Rows[0]["BrandID"].ToString();
                BindBrand();
                ddlBrand.SelectedValue = BrandID;

                SizeName = ds.Tables[0].Rows[0]["SizeName"].ToString();
                txtSize.Text = SizeName;
                MainCID = ds.Tables[0].Rows[0]["CategoryID"].ToString();
                BindMainCategory();
                ddlCategory.SelectedValue = MainCID;
            }
            else
            {

            }
            con.Close();
        }

        private void BindMainCategory()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from Tile", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "CatName";
                    ddlCategory.DataValueField = "CatID";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }

        private void BindBrand()
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from TileCompany", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    ddlBrand.DataSource = dt;
                    ddlBrand.DataTextField = "Name";
                    ddlBrand.DataValueField = "BrandID";
                    ddlBrand.DataBind();
                    ddlBrand.Items.Insert(0, new ListItem("-Select-", "0"));

                }
            }
        }

        protected void btnUpdateSize_Click(object sender, EventArgs e)
        {
            if (txtID.Text != string.Empty && txtSize.Text != string.Empty && ddlCategory.SelectedIndex != -1)
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString);
                if (con.State == ConnectionState.Closed) { con.Open(); }
                SqlCommand cmd = new SqlCommand("update tblSizes set SizeName=@SizeName,BrandID=@BrandID,CategoryID=@CategoryID where SizeID=@SizeID", con);
                cmd.Parameters.AddWithValue("@SizeID", Convert.ToInt32(txtID.Text));
                cmd.Parameters.AddWithValue("@CategoryID", ddlCategory.SelectedValue);
                cmd.Parameters.AddWithValue("@BrandID", ddlBrand.SelectedValue);
                cmd.Parameters.AddWithValue("@SizeName", txtSize.Text);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Update successfully')</script>");
                BindGridview();
                txtID.Text = string.Empty;
                ddlBrand.SelectedIndex = -1;
                ddlCategory.SelectedIndex = -1;
                txtSize.Text = string.Empty;

            }
        }
    }
}