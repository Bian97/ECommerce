<%-- 
    Document   : cart
    Created on : 23 de nov. de 2020, 13:38:12
    Author     : Bian
--%>

<%@page import="model.User"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="model.Cart"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrinho</title>
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
                    if(user.isType()){
                        response.sendRedirect(request.getContextPath() + "/index.jsp");
                    }
             %>
            <nav>
                <ul id="MenuItems">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="Product?action=load">Produtos</a></li>
                    <li><a href="Order?action=load">Pedidos</a></li>
                    <li><a href="User?action=load">Editar Conta</a></li>
                    <li><a href="User?action=exit">Sair</a></li>
                </ul>
            </nav>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>

    <!-- cart items details -->
    <div class="small-container cart-page">
        <% 
                final double tax = 35.50;
                Cart cart=(Cart)session.getAttribute("cart");
                if(cart != null){
                double subtotal = cart.getQuantity() * cart.getProduct().getPrice();
                DecimalFormat priceFormatter = new DecimalFormat("R$#0.00");
            %>            
                <table>
                <form action="Order?action=buy" method="POST">    
                <tr>
                    <th>Produto</th>
                    <th>Quantidade</th>
                    <th></th>
                </tr>

                <tr>
                    <td>
                        <div class="cart-info">
                            <img src="ProductImages/<%= cart.getProduct().getImagePath()%>">
                            <div>
                                <p><%= cart.getProduct().getName()%></p>
                                <small>Preço: <%= priceFormatter.format(cart.getProduct().getPrice())%></small>
                                <br>
                                <a href="Cart?action=remove">Remover</a>
                            </div>
                        </div>
                        <input type="hidden" id="price" name="price" value="<%=cart.getProduct().getPrice()%>"> 
                    </td>
                    <td><input type="number" id="cartQuantity" name="cartQuantity" onchange="setPrices()" value="<%= cart.getQuantity()%>"></td>
                    <td>
                        <button type="submit" class="btn">Comprar</button>
                    </td>
                </tr>
                </form>
            </table>
            <div class="total-price">
                <table>
                    <tr>
                        <td>Subtotal</td>
                        <td><label id="subTotal" value="<%= priceFormatter.format(subtotal)%>"><%= priceFormatter.format(subtotal)%></label></td>
                    </tr>
                    <tr>
                        <td>Imposto</td>
                        <td><label id="tax" value="<%= priceFormatter.format(tax)%>"><%= priceFormatter.format(tax)%></label></td>
                    </tr>
                    <tr>
                        <td>Total</td>
                        <td><label id="total" value="<%= priceFormatter.format(subtotal + tax)%>"><%=priceFormatter.format(subtotal + tax)%></label></td>
                    </tr>      
                </table>
        </div>
                <%} else {%>
                    <p>O carrinho estï¿½ vazio!</p>
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
        
        function setPrices(){
            var quantity =  document.getElementById('cartQuantity');
            var subTotal = document.getElementById('subTotal');
            var total = document.getElementById('total');
            var price = document.getElementById('price').value;
            
            var subValue = price * quantity.value;
            subTotal.innerHTML = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format((price * quantity.value));
            console.log(new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format((price * quantity.value)));
            total.innerHTML = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format((subValue + 35.5));
        }
    </script>

</body>
</html>