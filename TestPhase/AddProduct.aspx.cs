using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace TestPhase
{
    public partial class AddProduct : System.Web.UI.Page
    {
        public static String CS = ConfigurationManager.ConnectionStrings["TestPhaseDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //when page first time run then this code will execute
                BindBrand();
                BindCategory();
            }
        }

        private void BindCategory()
        {
            using (SqlConnection con = new SqlConnection(CS))
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
            using (SqlConnection con = new SqlConnection(CS))
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

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("sp_InsertProduct", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PName", txtProductName.Text);
                cmd.Parameters.AddWithValue("@PBrandID", ddlBrand.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@PCategoryID", ddlCategory.SelectedItem.Value);
                
                con.Open();
                Int64 PID = Convert.ToInt64(cmd.ExecuteScalar());

                // Insert Size Quantity

                for (int i = 0; i < cblSize.Items.Count; i++)
                {
                    if (cblSize.Items[i].Selected == true)
                    {
                        Int64 SizeID = Convert.ToInt64(cblSize.Items[i].Value);

                        SqlCommand cmd2 = new SqlCommand("insert into tblProductSizeQuantity values('" + PID + "','" + SizeID + "')", con);
                        cmd2.ExecuteNonQuery();
                    }
                }
                clr();
                Response.Write("<script> alert('Product Added Successfully'); </script>");
            }
        }

        private void clr()
        {
            txtProductName.Text = string.Empty;

            ddlBrand.ClearSelection();
            ddlBrand.Items.FindByValue("0").Selected = true;

            ddlCategory.ClearSelection();
            ddlCategory.Items.FindByValue("0").Selected = true;

            cblSize.ClearSelection();
            cblSize.Enabled = false;
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(CS))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("Select * from tblSizes where BrandID='" + ddlBrand.SelectedItem.Value + "' and CategoryID='" + ddlCategory.SelectedItem.Value + "'", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    cblSize.DataSource = dt;
                    cblSize.DataTextField = "SizeName";
                    cblSize.DataValueField = "SizeID";
                    cblSize.DataBind();

                }
            }
        }
    }
}