<%-- 
    Document   : purshased-products
    Created on : 30 de nov. de 2020, 11:11:42
    Author     : Bian
--%>

<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
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
            <%
                User user=(User)session.getAttribute("user");
                if (user == null)
                { 
                    response.sendRedirect(request.getContextPath() + "/account.jsp");
                } else { %>
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
            
    <% List<Order> orders = (ArrayList)session.getAttribute("orders");
    java.text.DateFormat df = new java.text.SimpleDateFormat("dd/MM/yyyy");%>

    <!-- order -->
    <div class="small-container order-page">
        <table>
            <tr>
                <th>Usuário</th>
                <th>Item</th>
                <th>Quantidade de itens</th>
                <th>Data de compra</th>
            </tr>
            <%for(int i = 0; i < orders.size(); i++){
            %>
                <tr>
                    <td><p><%=orders.get(i).getCart().getUser().getName()%></p></td>
                    <td><p><%=orders.get(i).getCart().getProduct().getName()%></p></td>
                    <td><%= orders.get(i).getCart().getQuantity() %></td>
                    <td><%= df.format(orders.get(i).getDate())%></td>
                </tr>
            <%}%>
        </table>
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
    </script>

</body>

</html>