<%-- 
    Document   : edit-account
    Created on : 23 de nov. de 2020, 09:52:05
    Author     : Bian
--%>
<%@ page import="model.User" %>
<%@ page import = " java.util.* " %>
<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Editar Conta</title>
        <meta charset="windows-1252">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div>Editar Conta</div><br>
        <form id="EditAccountForm" action="EditAccount?action=edit" method="POST">
            <%
                User user=(User)session.getAttribute("userInformations");
            %>
            
            <div>Editar Nome</div>
            <input name="user" type="text" placeholder="Nome" value="<%= user.getName() %>">
            <div>Editar E-mail</div>
                <input name="email" type="text" placeholder="E-mail" value="<%= user.getEmail() %>">
            <div>Editar Senha</div>
                <input name="password" type="text" placeholder="Senha" value="<%= user.getPassword() %>">
            <button type="submit" class="btn">Alterar</button>
        </form>
    </body>
</html>