<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="TestPhase.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <link href="css/Custome.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="navbar navbar-default navbar-fixed-top" role="navigation">

                <div class="container">

                    <div class="navbar-header">

                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            
                            <span class="sr-only">Toggle Navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>

                        </button>

                        <a class="navbar-brand" href="Default.aspx" ><span><img src="icons/logo.png" alt="TheShoeShop" height="30" /></span>TheShoeShop</a>

                    </div>

                    <div class="navbar-collapse collapse">

                        <ul class="nav navbar-nav navbar-right">
                            
                            <li ><a href="Default.aspx">Home</a></li>
                 
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tiles<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li ><a href="Products.aspx">All Tiles</a></li>
                                    <li role="separator" class="divider"></li>
                                    <li class="dropdown-header">Tiles</li>
                                    <li role="separator" class="divider"></li>
                                    <li ><a href="#">Tile Category</a></li>
                                    <li ><a href="#">Tile Company</a></li>
                                </ul>
                            </li>

                             <li ><a href="#">About</a></li>
                             <li ><a href="#">Contact Us</a></li>
                             <li class="active"><a href="SignUp.aspx">SignUp</a></li>
                             <li ><a href="SignIn.aspx">SignIn</a></li>

                        </ul>

                    </div>

                </div>

            </div>

        </div>

        <!---signup page start--->

            <div class="center-page">

                <label class="col-xs-11">UserName:</label>
                <div class="col-xs-11">
                <asp:TextBox ID="txtUname" runat="server" class="form-control" placeholder="Enter Your UserName"></asp:TextBox>
                </div>

                <label class="col-xs-11">Password:</label>
                <div class="col-xs-11">
                <asp:TextBox ID="txtPass" runat="server" class="form-control" TextMode="Password" placeholder="Enter Your Password"></asp:TextBox>
                </div>

                <label class="col-xs-11">Confirm Password:</label>
                <div class="col-xs-11">
                <asp:TextBox ID="txtCpass" runat="server" class="form-control" TextMode="Password" placeholder="Enter Your Confirm Password"></asp:TextBox>
                </div>

                <label class="col-xs-11">Your Full Name:</label>
                <div class="col-xs-11">
                <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Enter Your Full Name"></asp:TextBox>
                </div>

                <label class="col-xs-11">Email:</label>
                <div class="col-xs-11">
                <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Your Email"></asp:TextBox>
                </div>

                <label class="col-xs-11"></label>
                <div class="col-xs-11">
                <asp:Button ID="txtSignup" Class="btn btn-success" runat="server" Text="SignUp" OnClick="txtSignup_Click" />
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </div>

            </div>


        <!---signup page end--->
        <hr />
        <!---Footer content Start--->


        <footer class="footer-pos">

            <div class="container">
                <p class="pull-right"><a href="#">Back To Top</a></p>
                <p>&copy; 2023 BC190404416 Muhammad Ibrar &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Products</a>&middot; </p>
            </div>

        </footer>

        <!---Footer content End--->
    </form>
</body>
</html>
