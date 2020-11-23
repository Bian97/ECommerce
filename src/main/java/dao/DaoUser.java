/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Bian
 */
public class DaoUser {   
    public boolean Login(String user, String password, PrintWriter out, HttpServletRequest request, HttpServletResponse response){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {
              out = response.getWriter();
              dao.createPreparedStatement("select * from user where Name=? and Password=?");
              dao.setString(1, user);
              dao.setString(2, password);
              ResultSet rs = dao.executeQuery();              
              if(rs.next())
              {                
                request.getSession().setAttribute("user", rs.getString("Name"));
                request.getSession().setAttribute("userEmail", rs.getString("Email"));
                rs.close();
                dao.close();
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return true;
              } 
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Usuário e/ou senha inválido(s)!');");
              out.println("</script>");
              //out.println("Usuário e/ou senha inválido");
              rs.close();
              dao.close();
              return false;
            }
            catch(Exception e)
            {
                out.println(e.getMessage());
                return false;
            }
        } else {
            out.println("Erro de Conexão: " + dao.getErro());
            return false;
        }
    }
    
    public void Register(String user, String email, String password, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("insert into user (Name, Email, Password, Type) values (?, ?, ?, 0)");
              stmt.setString(1, user);
              stmt.setString(2, email);
              stmt.setString(3, password);

              if(stmt.executeUpdate() > 0){                    
                out.println("<html><body><b>"+user+" Inserido com sucesso"
                        + "</b></body></html>");
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("userEmail", email);
              } else{
                  out.println("Erro no Registro!");
              }

              stmt.close();

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
            }
        } else {
            out.println("Erro de Conexão!!");
        }
    }
    
    public void ChangePassword(String password, String email, HttpServletResponse response, PrintWriter out, HttpServletRequest request){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("UPDATE user SET Password = ? WHERE Email LIKE '%"+email+"%'");
              stmt.setString(1, password);
              
              if(stmt.executeUpdate() > 0){
                out.println("<html><body><b>Senha alterada com sucesso!"
                        + "</b></body></html>"); 
                response.sendRedirect(request.getContextPath() + "/account.jsp");
              } else{
                  out.println("E-mail não cadastrado!");
              }

              stmt.close();

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
            }
        }      
    }
    
    public void EditAccount(String name, String password, String email, HttpServletResponse response, PrintWriter out, HttpServletRequest request){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {
              var stmt = dao.createPreparedStatement("UPDATE user SET Name = ?, Password = ?, Email = ? WHERE Email LIKE '%"+email+"%'");
              stmt.setString(1, name);
              stmt.setString(2, password);
              stmt.setString(3, email);
              
              if(stmt.executeUpdate() > 0){
                User user = new User(name, email, password);
                request.getSession().setAttribute("userInformations", user);
                request.getSession().setAttribute("user", name);
                request.getSession().setAttribute("email", email);
                
                response.sendRedirect(request.getContextPath() + "/edit-account.jsp");
              } else{
                  out.println("Alteração com erro!");
              }

              stmt.close();

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
            }
        }
    }
    
    public void SearchUser(String email, HttpServletResponse response, PrintWriter out, HttpServletRequest request){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("SELECT * FROM user WHERE Email LIKE '%"+email+"%'");
              
              ResultSet rs = stmt.executeQuery();              
              if(rs.next())
              {
                User user = new User(rs.getString("Name"),rs.getString("Email"), rs.getString("Password"), rs.getBoolean("Type"));
                out.println(request.getSession().getAttribute("userEmail"));
                
                request.getSession().setAttribute("userInformations", user);
                request.getSession().setAttribute("user", rs.getString("Name"));
                request.getSession().setAttribute("userEmail", rs.getString("Email"));
                
                rs.close();
                stmt.close();
                response.sendRedirect(request.getContextPath() + "/edit-account.jsp");
              }
              rs.close();
              stmt.close();

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
            }
        }
    }
}