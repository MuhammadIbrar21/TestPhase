<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="TestPhase.AddCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

                <div class="form-horizontal">
                    <br />
                    <br />
                    <h2>Add Category</h2>
                    <hr />
                    <div class="form-group">

                        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Category Name"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtCategory" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategoryName" CssClass="text-danger" runat="server" ErrorMessage="Please Enter CategoryName" ControlToValidate="txtCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                    </div>

                    

                    <div class="form-group">
                        
                        <div class="col-md-2"></div>

                        <div class="col-md-6">
                            
                            <asp:Button ID="btnAddCategory" CssClass="btn btn-success" runat="server" Text="Add Category" OnClick="btnAddCategory_Click" />

                        </div>

                    </div>

                </div>

              
              


            </div>

</asp:Content>
