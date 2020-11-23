<%-- 
    Document   : cart
    Created on : 23 de nov. de 2020, 13:38:12
    Author     : Bian
--%>

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
            <nav>
                <ul id="MenuItems">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="products.jsp">Produtos</a></li>
                    <li><a href="order.jsp">Pedidos</a></li>
                    <li><a href="EditAccount?action=load">Editar Conta</a></li>
                </ul>
            </nav>
            <a href="cart.jsp"><i class="fa fa-shopping-cart"></i></a>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>

    <!-- cart items details -->
    <div class="small-container cart-page">
        <table>
            <tr>
                <th>Produto</th>
                <th>Quantidade</th>
                <th>Subtotal</th>
            </tr>
            <tr>
                <td>
                    <div class="cart-info">
                        <img src="images/placeholder.png">
                        <div>
                            <p>Lorem ipsum dolor</p>
                            <small>Price: R$50,00</small>
                            <br>
                            <a href="">Remover</a>
                        </div>
                    </div>
                </td>
                <td><input type="number" value="1"></td>
                <td>R$50,00</td>
            </tr>
            <tr>
                <td>
                    <div class="cart-info">
                        <img src="images/placeholder.png">
                        <div>
                            <p>Lorem ipsum dolor</p>
                            <small>Price: R$50,00</small>
                            <br>
                            <a href="">Remove</a>
                        </div>
                    </div>
                </td>
                <td><input type="number" value="1"></td>
                <td>R$50,00</td>
            </tr>
            <tr>
                <td>
                    <div class="cart-info">
                        <img src="images/placeholder.png">
                        <div>
                            <p>Lorem ipsum dolor</p>
                            <small>Price: R$50,00</small>
                            <br>
                            <a href="">Remove</a>
                        </div>
                    </div>
                </td>
                <td><input type="number" value="1"></td>
                <td>R$50,00</td>
            </tr>
        </table>
        <div class="total-price">
            <table>
                <tr>
                    <td>Subtotal</td>
                    <td>R$200,00</td>
                </tr>
                <tr>
                    <td>Imposto</td>
                    <td>R$35,00</td>
                </tr>
                <tr>
                    <td>Total</td>
                    <td>R$230,00</td>
                </tr>
            </table>
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
    </script>

</body>
</html>