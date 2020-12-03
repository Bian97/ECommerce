<%-- 
    Document   : forgot-password
    Created on : 30 de nov. de 2020, 10:10:42
    Author     : Bian
--%>

<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Esqueci a senha</title>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>Digite o seu e-mail e uma nova senha!</div>
        <form action="User?action=changePassword" method="POST">
            <input name="email" type="text" placeholder="E-mail">
            <input name="password" type="password" placeholder="Senha">
            <button type="submit" class="btn">Enviar</button>
        </form>
    </body>
</html>