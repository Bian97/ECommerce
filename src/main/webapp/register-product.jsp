<%-- 
    Document   : register-product.jsp
    Created on : 24 de nov. de 2020, 00:29:29
    Author     : Bian
--%>

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
                    <li><a href="EditAccount?action=load">Editar Conta</a></li>
                </ul>
            </nav>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>

    <!-- product register -->
    <div class="small-container register-product">
        <form action="Product?action=save" method="POST">
            <div class="row">
                <div class="col-2">
                    <img src="images/placeholder.png" width="100%">
                </div>
                <div class="col-2">
                    <div class="form-container">                    
                        <input name="name" type="text" placeholder="Nome do Produto">
                        <input name="price" type="number" step="any" placeholder="20,00">
                        <input name="description" type="text" placeholder="Descrição do Produto">
                        <button type="submit" class="btn">Criar novo Produto</button>                    
                    </div>
                    <br>
                </div>
            </div>
        </form>
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