<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ProductView.aspx.cs" Inherits="TestPhase.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <br />
    <br />
    <div style="padding-top: 50px;">
       
        <div class="col-md-5">

            <asp:Repeater ID="rptrProductDetails" runat="server" OnItemDataBound="rptrProductDetails_ItemDataBound">
                <ItemTemplate>

                    <div class="divDet1">
                        <h1 class="proNameView"><%# Eval("PName") %></h1>
                    </div>
                    <div>
                        <h5 class="h5size">SIZE</h5>
                        <div>
                            <asp:RadioButtonList ID="rblSize" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="S" Text="10*10"></asp:ListItem>
                                <asp:ListItem Value="M" Text="10*12"></asp:ListItem>
                                <asp:ListItem Value="L" Text="10*20"></asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>

                    <asp:HiddenField ID="hfCatID" runat="server" Value='<%# Eval("PCategoryID") %>' />
                    <asp:HiddenField ID="hfBrandID" runat="server" Value='<%# Eval("PBrandID") %>' />

                </ItemTemplate>
            </asp:Repeater>

        </div>

    </div>

</asp:Content>
