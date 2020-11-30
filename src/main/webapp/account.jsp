<%-- 
    Document   : account
    Created on : 23 de nov. de 2020, 13:04:04
    Author     : Bian
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Conta</title>
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
            <%
                User user=(User)session.getAttribute("user");
                if (user != null)
                {
                    response.sendRedirect(request.getContextPath() + "/edit-account.jsp");
                }
             %>
            <nav>
                <ul id="MenuItems">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="Product?action=load">Produtos</a></li>                    
                </ul>
            </nav>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>

    <!-- account-page -->
    <div class="account-page">
        <div class="container">
            <div class="row">
                <div class="col-2">
                    <img src="images/gamer-computer.png" width="100%">
                </div>
                <div class="col-2">
                    <div class="form-container">
                        <div class="form-btn">
                            <span onclick="login()">Login</span>
                            <span onclick="register()">Cadastrar</span>
                            <hr id="Indicator" >
                        </div>
                        <form id="LoginForm" action="User?action=login" method="POST">
                            <input name="name" type="text" placeholder="Usuario">
                            <input name="password" type="password" placeholder="Senha">
                            <button type="submit" class="btn">Login</button>
                            <a href="forgot-password.jsp">Esqueci a Senha</a>
                        </form>
                        <form id="RegForm" action="User?action=register" method="POST">
                            <input name="name" type="text" placeholder="Usuario">
                            <input name="email" type="email" placeholder="Email">
                            <input name="password" type="password" placeholder="Senha">
                            <button type="submit" class="btn">Cadastrar</button>
                        </form>
                    </div>
                </div>
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

        var LoginForm = document.getElementById("LoginForm")
        var RegForm = document.getElementById("RegForm")
        var Indicator = document.getElementById("Indicator")

        const register = () => {
            RegForm.style.transform = "translateX(0px)"
            LoginForm.style.transform = "translateX(0px)"
            Indicator.style.transform = "translateX(100px)"
        }

        const login = () => {
            RegForm.style.transform = "translateX(300px)"
            LoginForm.style.transform = "translateX(300px)"
            Indicator.style.transform = "translateX(0px)"
        }

    </script>

</body>
</html>