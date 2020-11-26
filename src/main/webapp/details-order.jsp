<%-- 
    Document   : details-order
    Created on : 25 de nov. de 2020, 11:02:51
    Author     : Bian
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Order"%>
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
            <a href="Cart?action=load"><i class="fa fa-shopping-cart"></i></a>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>

    <!-- single product details -->
    <div class="small-container single-product">
        <div class="row">
             <%
                Order order=(Order)session.getAttribute("order");
             %>
            <div class="col-2">
                <img src="ProductImages/<%= order.getCart().getProduct().getImagePath()%>" width="100%" id="ProductImg">
            </div>
            <div class="col-2">
                <h1><%= order.getCart().getProduct().getName()%></h1>
                <%DecimalFormat priceFormatter = new DecimalFormat("R$#0.00");%>
                <h4>Valor: <%= priceFormatter.format(order.getCart().getProduct().getPrice())%></h4>
                <h5>Quantidade: <%= order.getCart().getQuantity() %></h5>
                <br>
                <h3>Descrição <i class="fa fa-indent"></i></h3>
                <p><%= order.getCart().getProduct().getDescription()%></p>
                <br>
                <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");%>
                <h2> <%=df.format(order.getDate()) %> - <%= order.getStatus() %></h2>
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