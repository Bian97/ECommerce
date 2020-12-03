<%-- 
    Document   : register-product.jsp
    Created on : 24 de nov. de 2020, 00:29:29
    Author     : Bian
--%>

<%@page import="model.User"%>
<%@page import="model.Product"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adicionar Produto</title>
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
                if (user == null)
                {
                    response.sendRedirect(request.getContextPath() + "/account.jsp");
                } else {
             %>
            <nav>
                <ul id="MenuItems">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="Product?action=load">Produtos</a></li>
                    <li><a href="User?action=load">Editar Conta</a></li>
                    <li><a href="User?action=exit">Sair</a></li>
                </ul>
            </nav>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>

    <!-- product register -->
    <div class="small-container register-product">
           <% 
               String action = (String)request.getParameter("action");
               if(action.equals("save")){
            %>
            <form action="Product?action=save" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-2">
                            <label for="FileInput">
                                <img id="frame" name="fileInput" src="images/placeholder.png" width="100%">
                            </label>
                            <input id="FileInput" name="fileInput" type="file" onchange="preview()" style="cursor: pointer;  display: none"/>
                        </div>
                        <div class="col-2">
                            <div class="form-container">                    
                                <input name="name" type="text" placeholder="Nome do Produto">
                                <input name="price" type="number" step="any" placeholder="20,00">
                                <input name="description" type="text" placeholder="Descri��o do Produto">
                                <button type="submit" class="btn">Criar novo Produto</button>                    
                            </div>
                            <br>
                        </div>
                    </div>
                </form>
            <%} else if(action.equals("loadDetails")) {
                Product product = (Product)session.getAttribute("product");
              %>
                <form action="Product?action=update" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <div class="col-2">
                            <label for="FileInput">
                                <img id="frame" src="ProductImages/<%= product.getImagePath()%>" width="100%" name="fileInput">
                            </label>
                            <input id="FileInput" type="file" onchange="preview()" name="fileInput" style="cursor: pointer;  display: none"/>
                        </div>
                        <div class="col-2">
                            <div class="form-container">                    
                                <input name="name" type="text" placeholder="Nome do Produto" value="<%= product.getName() %>">
                                <input name="price" type="number" step="any" placeholder="20,00" value="<%= product.getPrice() %>">
                                <input name="description" type="text" placeholder="Descri��o do Produto" value="<%= product.getDescription() %>">
                                <button type="submit" class="btn">Salvar altera��o</button>
                            </div>
                            <br>
                        </div>
                    </div>
                </form>
        <%}%>
    </div>
    <%}%>

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
        function preview() {
            frame.src=URL.createObjectURL(event.target.files[0]);
        }
    </script>

</body>

</html>