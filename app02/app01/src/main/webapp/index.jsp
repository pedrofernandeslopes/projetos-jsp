<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Página Inicial - Boas-Vindas</title>
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        text-align: center;
        margin-top: 80px;
        background-color: #e0f7fa;
        color: #333;
    }
    .container {
        padding: 30px;
        border-radius: 12px;
        background-color: #ffffff;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        display: inline-block;
        max-width: 500px;
        width: 90%;
    }
    h1 {
        color: #00796b;
        margin-bottom: 25px;
    }
    form {
        margin-top: 20px;
    }
    label {
        display: block;
        margin-bottom: 10px;
        font-size: 1.1em;
        font-weight: bold;
        color: #004d40;
    }
    input[type="text"] {
        width: calc(100% - 22px); /* Considerando padding e border */
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #b2dfdb;
        border-radius: 8px;
        font-size: 1.1em;
    }
    input[type="submit"] {
        background-color: #00796b;
        color: white;
        padding: 12px 25px;
        border: none;
        border-radius: 8px;
        font-size: 1.1em;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #004d40;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>Bem-vindo ao Meu Teste JSP!</h1>
        <p>Por favor, digite seu nome para uma saudação personalizada:</p>
        <form action="Cadastrar" method="post">
            <label for="nomeUsuario">Seu Nome:</label>
            <input type="text" id="nome" name="nome" placeholder="Ex: Maria" required>
            <input type="submit" value="Cadastrar">
        </form>				
        <p><small>Este é um exemplo simples de interação com JSP.</small></p>
    </div>
</body>
</html>
