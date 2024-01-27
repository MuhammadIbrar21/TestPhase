<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddBrand.aspx.cs" Inherits="TestPhase.AddBrand" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container">

        <div class="form-horizontal">
            <br />
            <br />
            <h2>Add Company</h2>
            <hr />
            <div class="form-group">

                <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="CompanyName"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="txtBrand" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrandName" CssClass="text-danger" runat="server" ErrorMessage="Please Enter Brandname" ControlToValidate="txtBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>

            </div>



            <div class="form-group">

                <div class="col-md-2"></div>

                <div class="col-md-6">

                    <asp:Button ID="btnAddBrand" CssClass="btn btn-success" runat="server" Text="Add" OnClick="btnAddBrand_Click" />

                </div>

            </div>




        </div>

        

    </div>

</asp:Content>
