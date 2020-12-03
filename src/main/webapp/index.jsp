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
                        <li><a href="Product?action=load">Produtos</a></li>                        
                        <%
                            User user=(User)session.getAttribute("user");
                            if (user == null)
                            {
                         %>
                                <li><a href="account.jsp">Conta</a></li>
                        <%  } else {%>
                                <li><a href="Order?action=load">Pedidos</a></li>
                                <li><a href="User?action=load">Editar Conta</a></li>
                                <li><a href="User?action=exit">Sair</a></li>
                                <%
                                    if (!user.isType())
                                    {
                                %>
                                <a href="Cart?action=load"><i class="fa fa-shopping-cart"></i></a>
                                <%  }%>
                        <%  }%>
                    </ul>
                </nav>
                <i class="fa fa-bars" onclick="menutoggle()"></i>
            </div>
            <div class="row">
                <div class="col-2">
                    <h1> Melhores Computadores aqui!<br>Confira já!</h1>
                    <p>Confira já os computadores com as peças mais recentes do mercado.<br> Basta você clicar no botão abaixo, aproveitar os melhores preços e as melhores máquinas!</p>
                    <a href="Product?action=load" class="btn">Veja a lista completa &#8594;</a>
                </div>
                <div class="col-2">
                    <img src="images/gamer-computer.png">
                </div>
            </div>
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