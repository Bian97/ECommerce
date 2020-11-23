<%-- 
    Document   : index
    Created on : 22 de nov. de 2020, 22:39:24
    Author     : Bian
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ecommerce Website</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <!----- header ---->
    <div class="header">
        <div class="container">
            <div class="navbar">
                <div class="logo">
                    <a href="index.jsp"><img src="images/placeholder-logo.png" width="125px"></a>
                </div>
                <nav>
                    <ul id="MenuItems">
                        <li><a href="products.jsp">Produtos</a></li>                        
                        <%
                            User user=(User)session.getAttribute("user");
                            if (user == null)
                            {
                         %>
                                <li><a href="account.jsp">Conta</a></li>
                        <%  } else {%>
                                <li><a href="order.jsp">Pedidos</a></li>
                                <li><a href="EditAccount?action=load">Editar Conta</a></li>
                                <a href="cart.jsp"><i class="fa fa-shopping-cart"></i></a>
                        <%  }%>
                    </ul>
                </nav>
                <i class="fa fa-bars" onclick="menutoggle()"></i>
            </div>
            <div class="row">
                <div class="col-2">
                    <h1> Lorem ipsum dolor<br>sit amet!</h1>
                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
                        Aenean efficitur fringilla<br> lorem id tincidunt.
                        Quisque fringilla enim nisi, ac ultricies. </p>
                    <a href="products.html" class="btn">Veja a lista completa &#8594;</a>
                </div>
                <div class="col-2">
                    <img src="images/gamer-computer.png">
                </div>
            </div>
        </div>
    </div>
    <!----- featured products ---->
    <div class="small-container">
        <h2 class="title">Destaques</h2>
        <div class="row">
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-half-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
        </div>
    </div>
    <!--footer -->
    <div class="footer">
        <div class="container">
            <p class="copyright">Trabalho A2 Aplicações na internet</p>
            <hr>
            <p class="copyright">Copyright 2020 - Placeholder Victor Franklin, Bian Medeiros, Alexandre</p>
        </div>
    </div>

    <script>
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight = "0px";

        function menutoggle() {
            if (MenuItems.style.maxHeight == "0px") {
                MenuItems.style.maxHeight = "200px"
            } else {
                MenuItems.style.maxHeight = "0px"
            }
        }
    </script>

</body>

</html>