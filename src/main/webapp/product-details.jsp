<%-- 
    Document   : product-details
    Created on : 24 de nov. de 2020, 10:19:19
    Author     : Bian
--%>

<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produto</title>
    <link rel="stylesheet" href="style.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
    <div class="container">
        <div class="navbar">
            <div class="logo">
                <a href="index.jsp"><img src="images/placeholder-logo.png" width="125px"></a>
            </div>
            <nav>
                <ul id="MenuItems">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="Product?action=load">Produtos</a></li>
                    <li><a href="Order?action=load">Pedidos</a></li>
                    <li><a href="User?action=load">Editar Conta</a></li>
                </ul>
            </nav>
            <a href="cart.jsp"><i class="fa fa-shopping-cart"></i></a>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>

    <!-- single product details -->
    <div class="small-container single-product">
        <div class="row">
            <div class="col-2">
                <img src="images/placeholder.png" width="100%" id="ProductImg">
            </div>
            <%
                Product product=(Product)session.getAttribute("product");
             %>             
            <div class="col-2">
                <form action="Cart?action=add" method="POST">
                    <h1><%= product.getName()%></h1>
                    <h4>R$ <%= product.getPrice()%></h4>
                    <input name="quantity" type="number" value="1">
                    <button type="submit" class="btn">Adicionar ao Carrinho</button>
                    <h3>Descrição <i class="fa fa-indent"></i></h3>
                    <br>
                    <p><%= product.getDescription()%></p>
                </form>
            </div>
        </div>
    </div>

    <!-- title -->
    <div class="small-container">
        <div class="row row-2">
            <h2>Outros Produtos</h2>
            <p>Ver mais</p>
        </div>
    </div>

    <!-- products -->

    <div class="small-container">
        <div class="row">
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <p>R$ 50,00</p>
            </div>
        </div>
    </div>
    <!--footer -->
    <div class="footer">
        <div class="container">
            <p class="copyright">Trabalho A2 Aplicações na internet</p>
            <hr>
            <p class="copyright">Copyright 2020 - Placeholder, Victor Franklin, Bian Medeiros, Alexandre</p>
        </div>
    </div>

    <script>
        var MenuItems = document.getElementById("MenuItems");
        MenuItems.style.maxHeight = "0px";

        const menutoggle = () => {
            if (MenuItems.style.maxHeight == "0px") {
                MenuItems.style.maxHeight = "200px"
            } else {
                MenuItems.style.maxHeight = "0px"
            }
        }      
    </script>

</body>

</html>