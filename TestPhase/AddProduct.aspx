<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="TestPhase.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div class="form-horizontal">

            <br />
            <br />

            <h2>Add Product</h2>

            <hr />

           <%-- // Add Product--%> 

            <div class="form-group">

                <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Product Name"></asp:Label>

                <div class="col-md-3">

                    <asp:TextBox ID="txtProductName" CssClass="form-control" runat="server"></asp:TextBox>

                </div>

            </div>

            <%--// Product Brand--%>

            <div class="form-group">

                <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Brand"></asp:Label>

                <div class="col-md-3">

                    <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>

                </div>

            </div>

            <%--//Product Category--%>

            <div class="form-group">

                <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Product Category"></asp:Label>

                <div class="col-md-3">

                    <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" ></asp:DropDownList>

                </div>

            </div>

            <%--// Product Size--%>

            <div class="form-group">

                <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="Size"></asp:Label>

                <div class="col-md-3">

                    <asp:CheckBoxList ID="cblSize" CssClass="form-control" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>

                </div>

            </div>

            <div class="form-group">

                <div class="col-md-2"></div>

                <div class="col-md-6">

                    <asp:Button ID="btnAdd" CssClass="btn btn-success" runat="server" Text="Add Product" OnClick="btnAdd_Click" />

                </div>

            </div>

        </div>

    </div>

</asp:Content>
