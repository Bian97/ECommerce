<%-- 
    Document   : edit-account
    Created on : 23 de nov. de 2020, 09:52:05
    Author     : Bian
--%>

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
        <form id="EditAccountForm" action="EditAccount" method="POST">
            <div>Editar Nome</div>
                <input name="nome" type="text" placeholder="Nome">
            <div>Editar E-mail</div>
                <input name="email" type="text" placeholder="E-mail">
            <div>Editar Senha</div>
                <input name="password" type="password" placeholder="Senha">
            <button type="submit" class="btn">Enviar</button>
        </form>
    </body>
</html>