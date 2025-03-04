<%-- 
    Document   : products
    Created on : 23 de nov. de 2020, 13:14:37
    Author     : Bian
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Array"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Todos Produtos</title>
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
                    <!--<li><a href="products.jsp">Produtos</a></li>-->
                </ul>
            </nav>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>
    <div class="small-container">
        <div class="row row-2">
            <h2>Produtos</h2>
        </div>
        <%
            if(user != null){
                if (user.isType())
                {
        %>
                    <a href="operate-product.jsp?action=save" class="btn">Adicionar Produto</a>
        <%      }
            }%>
        <div class="row">
            <% List<Product> products = (ArrayList)session.getAttribute("products");
            DecimalFormat priceFormatter = new DecimalFormat("R$#0.00");
                for(int i = 0; i < products.size(); i++){
                    %>
            <div class="col-4">
                <a href="Product?action=select&id=<%= products.get(i).getId() %>">
                    <!--<img src="images/placeholder.png">-->
                    <img src="<%="ProductImages/"+ products.get(i).getImagePath()%>" alt="">
                    <%= products.get(i).getName() %>
                </a>
                
                    <p> <%= priceFormatter.format(products.get(i).getPrice()) %> </p>
                <%
                    if(user != null){
                        if (user.isType())
                        {
                %>
                            <div class="edit-remove">
                                <a href="Product?action=loadDetails&id=<%=products.get(i).getId()%>"> <i class="fa fa-edit"></i></a>
                                <a href="Product?action=remove&id=<%=products.get(i).getId()%>&file=<%=products.get(i).getImagePath()%>"><i class="fa fa-trash"></i></a>
                            </div>
                <%      }
                    }%>

            </div>
            <%}%>
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