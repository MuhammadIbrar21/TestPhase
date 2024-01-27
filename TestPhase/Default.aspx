<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TestPhase.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tile Store</title>

    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous">

    </script>

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE-edge" />
    <link href="css/Custome.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


    <script>

        $(document).ready(function myfunction() {
            $("#btnCart").click(function myfunction() {
                window.location.href = "~/Cart.aspx";
            });
        });

    </script>

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

                        <a class="navbar-brand" href="Default.aspx" ><span><img src="icons/logo.png" alt="TileStore" height="30" /></span>Tile Store</a>

                    </div>

                    <div class="navbar-collapse collapse">

                        <ul class="nav navbar-nav navbar-right">
                            
                            <li class="active"><a href="Default.aspx">Home</a></li>
                 
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
                             
                             <li id="btnSignUP" runat="server"><a href="SignUp.aspx">SignUp</a></li>
                             <li id="btnSignIN" runat="server"><a href="SignIn.aspx">SignIn</a></li>
                             <li>
                                 <asp:Button ID="btnlogout" CssClass="btn btn-default navbar-btn" runat="server" Text="Sign Out" OnClick="btnlogout_Click" />
                             </li>

                        </ul>

                    </div>

                </div>

            </div>

        </div>

        <!---Footer content Start--->  
        <hr />
            <footer >

            <div class="container">
                <p class="pull-right"><a href="#">Back To Top</a></p>
                <p>&copy; 2023 BC190404416 Muhammad Ibrar &middot; <a href="Default.aspx">Home</a>&middot;<a href="#">About</a>&middot;<a href="#">Contact</a>&middot;<a href="#">Products</a>&middot; </p>
            </div>

        </footer>

        <!---Footer content End--->

    </form>
</body>
</html>
