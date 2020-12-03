<%-- 
    Document   : forgot-password
    Created on : 30 de nov. de 2020, 10:10:42
    Author     : Bian
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <title>Esqueci a senha</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                </ul>
            </nav>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>
    <div class="row">
        <div class="form-container">
                <div>Digite o seu e-mail e uma nova senha!</div>
                <form action="User?action=changePassword" method="POST">
                    <input name="email" type="text" placeholder="E-mail">
                    <input name="password" type="password" placeholder="Senha">
                    <button type="submit" class="btn">Enviar</button>
                </form>
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