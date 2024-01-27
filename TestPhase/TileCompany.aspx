﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="TileCompany.aspx.cs" Inherits="TestPhase.TileCompany" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Stylesheets" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Tile Company</title>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
  <h2>Tile Company</h2>  

    <div class="panel panel-primary">
      <div class="panel-heading">Tile Company</div>
      <div class="panel-body">

      <asp:TextBox ID="txtFilterGrid1Record" CssClass="form-control" runat="server" 
              placeholder="Search Company...." AutoPostBack="true" 
              ontextchanged="txtFilterGrid1Record_TextChanged" ></asp:TextBox>
      <br />
      <hr />
      <asp:repeater ID="rptrProducts" runat="server">
           <ItemTemplate>
        <div class="col-sm-3 col-md-3">
            <a href="ProductView.aspx?PID=<%# Eval("PID") %>" style="text-decoration:none;">
          <div class="thumbnail">              
              <div class="caption"> 
                   <div class="probrand"><%# Eval ("BrandName") %>  </div>
                   <div class="proName"> <%# Eval ("PName") %> </div>
                   
              </div>
          </div>
                </a>
        </div>
               
               </ItemTemplate>
       </asp:repeater>
      
      </div>
      <div class="panel-footer">  </div>
    </div>
    
</div>

</asp:Content>