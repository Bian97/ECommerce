<%-- 
    Document   : edit-account
    Created on : 23 de nov. de 2020, 09:52:05
    Author     : Bian
--%>
<%@ page import="model.User" %>
<%@ page import = " java.util.* " %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Conta</title>
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

    </div>
    <div class="account-page">
        <div class="container edit-account">
            <div class="row">
                <div class="col-2">
                    <img src="images/gamer-computer.png" width="100%">
                </div>
                <div class="col-2">
                    <div class="form-container">
                        <div class="form-btn">
                            <span>Editar Conta</span>
                        </div>
                        <form id="EditAccountForm" action="EditAccount?action=edit" method="POST">
                            <%
                                user=(User)session.getAttribute("user");
                            %>

                            <input name="user" type="text" placeholder="Nome" value="<%= user.getName() %>">
                            <input name="email" type="text" placeholder="E-mail" value="<%= user.getEmail() %>">
                            <input name="password" type="text" placeholder="Senha" value="<%= user.getPassword() %>">
                            <button type="submit" class="btn">Alterar</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--footer -->
    <div class="footer">
        <div class="container">
            <p class="copyright">Trabalho A2 Aplica��es na internet</p>
            <hr>
            <p class="copyright">Copyright 2020 - Placeholder, Victor Franklin, Bian Medeiros, Alexandre</p>
        </div>

</body>

</html>