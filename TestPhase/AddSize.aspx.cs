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
    public partial class AddSize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindBrand();
                BindMainCategory();
            }
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

        protected void btnAddSize_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Insert into tblSizes (SizeName,BrandID,CategoryID) values('" + txtSize.Text + "','" + ddlBrand.SelectedItem.Value + "','" + ddlCategory.SelectedItem.Value + "')", con);
                cmd.ExecuteNonQuery();

                Response.Write("<script> alert('Size Added Successfully'); </script>");

                txtSize.Text = string.Empty;
                con.Close();
                ddlBrand.ClearSelection();
                ddlBrand.Items.FindByValue("0").Selected = true;

                ddlCategory.ClearSelection();
                ddlCategory.Items.FindByValue("0").Selected = true;

            }
        }
    }
}