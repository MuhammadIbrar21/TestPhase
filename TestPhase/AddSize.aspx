<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.Master" AutoEventWireup="true" CodeBehind="AddSize.aspx.cs" Inherits="TestPhase.AddSize" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

                <div class="form-horizontal">
                    <br />
                    <br />
                    <h2>Add Size</h2>
                    <hr />


                    <div class="form-group">

                        <asp:Label ID="Label1" CssClass="col-md-2 control-label" runat="server" Text="Size Name"></asp:Label>
                        <div class="col-md-3">
                            <asp:TextBox ID="txtSize" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorSize" CssClass="text-danger" runat="server" ErrorMessage="Please Enter Size" ControlToValidate="txtSize" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                    </div>


                    <div class="form-group">

                        <asp:Label ID="Label3" CssClass="col-md-2 control-label" runat="server" Text="Company"></asp:Label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlBrand" CssClass="form-control" runat="server"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorBrand" CssClass="text-danger" runat="server" ErrorMessage="Please Enter Brand" ControlToValidate="ddlBrand" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                    </div>


                    <div class="form-group">

                        <asp:Label ID="Label4" CssClass="col-md-2 control-label" runat="server" Text="Category"></asp:Label>
                        <div class="col-md-3">
                            <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"  AutoPostBack="true"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorCategory" CssClass="text-danger" runat="server" ErrorMessage="Please Enter Category" ControlToValidate="ddlCategory" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>

                    </div>


                    

                    

                    <div class="form-group">
                        
                        <div class="col-md-2"></div>

                        <div class="col-md-6">
                            
                            <asp:Button ID="btnAddSize" CssClass="btn btn-success" runat="server" Text="Add Size" OnClick="btnAddSize_Click" />

                        </div>

                    </div>

                </div>
              
              

            </div>

</asp:Content>
