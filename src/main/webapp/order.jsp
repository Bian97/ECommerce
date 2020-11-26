<%-- 
    Document   : order.jsp
    Created on : 23 de nov. de 2020, 13:47:49
    Author     : Bian
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pedidos</title>
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
                    <li><a href="User?action=load">Editar Conta</a></li>
                    <%
                        User user=(User)session.getAttribute("user");
                        if (!user.isType())
                        {
                    %>
                            <a href="Cart?action=load"><i class="fa fa-shopping-cart"></i></a>
                    <%  }%>
                </ul>
            </nav>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>
    <% List<Order> orders = (ArrayList)session.getAttribute("orders");%>    
    <!-- order -->
    <div class="small-container order-page">
        <table>
            <tr>
                <th></th>
                <th>Pedido</th>
                <th>Data</th>
                <th>Total</th>
                <th>Status</th>
            </tr>
            <%for(int i = 0; i < orders.size(); i++){
            %>
                <tr>
                    <td><small><a href="Order?action=select&id=<%= orders.get(i).getId()%>">Ver detalhes</a></small></td>
                    <td>
                        <div class="order-info">
                            <p><%= orders.get(i).getId()%></p>
                        </div>
                    </td>
                    <%java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");
                    DecimalFormat priceFormatter = new DecimalFormat("R$#0.00");%>
                    <td><%=df.format(orders.get(i).getDate()) %></td>
                    <td><%= priceFormatter.format(orders.get(i).getCart().getProduct().getPrice() * orders.get(i).getCart().getQuantity() + 35.5)%></td>
                    <td><%=orders.get(i).getStatus()%></td>
                </tr>
            <%}%>
        </table>
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