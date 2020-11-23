<%-- 
    Document   : products
    Created on : 23 de nov. de 2020, 13:14:37
    Author     : Bian
--%>

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
                <a href="index.html"><img src="images/placeholder-logo.png" width="125px"></a>
            </div>
            <nav>
                <ul id="MenuItems">
                    <li><a href="index.jsp">Home</a></li>
                    <%
                        String user = (String)session.getAttribute("user");
                        if (user == "common")
                        {
                     %>
                            <li><a href="account.jsp">Conta</a></li>
                    <%  } else {%>
                            <li><a href="order.html">Pedidos</a></li>
                            <li><a href="EditAccount?action=load">Editar Conta</a></li>
                            <a href="cart.html"><i class="fa fa-shopping-cart"></i></a>
                    <%  }%>
                    <!--<li><a href="products.html">Produtos</a></li>
                    <li><a href="order.html">Pedidos</a></li>
                    <li><a href="account.html">Conta</a></li>-->
                </ul>
            </nav>
            <i class="fa fa-bars" onclick="menutoggle()"></i>
        </div>
    </div>
    <div class="small-container">
        <div class="row row-2">
            <h2>Produtos</h2>
            <select>
                <option>Default Shorting</option>
                <option>Default Shorting</option>
                <option>Default Shorting</option>
                <option>Default Shorting</option>
                <option>Default Shorting</option>
            </select>
        </div>
        <a href="register-product.html" class="btn">Adicionar Produto</a>
        <div class="row">
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-half-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-half-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
        </div>
        <div class="row">
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-half-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
            <div class="col-4">
                <img src="images/placeholder.png">
                <h4>Lorem ipsum dolor</h4>
                <div class="rating">
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star"></i>
                    <i class="fa fa-star-o"></i>
                </div>
                <p>R$ 50,00</p>
            </div>
        </div>
        <div class="page-btn">
            <span>1</span>
            <span>2</span>
            <span>3</span>
            <span>4</span>
            <span>&#8594;</span>
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