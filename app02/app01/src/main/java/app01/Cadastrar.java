package app01;

import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Cadastrar")
public class Cadastrar extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String texto = request.getParameter("nome");
        // MODIFICAÇÃO AQUI:
        String url = "jdbc:mysql://localhost:3306/cadastro_pessoas?allowPublicKeyRetrieval=true&useSSL=false";
        String user = "root";
        String password = "12345";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            String sql = "INSERT INTO pessoas (nome) VALUES (?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, texto);
            stmt.executeUpdate();
            stmt.close();
            conn.close();
            response.sendRedirect("index.jsp"); // Ou uma página de sucesso
        } catch (Exception e) {
            e.printStackTrace();
            // É uma boa prática mostrar uma mensagem de erro mais amigável para o usuário
            // e logar os detalhes completos no servidor.
            response.getWriter().println("Erro ao cadastrar: " + e.getMessage() + "<br><br>Verifique o console do servidor para mais detalhes.");
        }
    }
}