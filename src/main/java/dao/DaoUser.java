/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

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
    public boolean Login(String name, String password, PrintWriter out, HttpServletRequest request, HttpServletResponse response){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {
              out = response.getWriter();
              dao.createPreparedStatement("select * from user where Name=? and Password=?");
              dao.setString(1, name);
              dao.setString(2, password);
              ResultSet rs = dao.executeQuery();              
              if(rs.next())
              {
                User user = new User(rs.getInt("IdUser"),rs.getString("Name"),rs.getString("Email"), rs.getString("Password"), rs.getBoolean("Type"));
                request.getSession().setAttribute("user", user);
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
    
    public void Register(String name, String email, String password, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("insert into user (Name, Email, Password, Type) values (?, ?, ?, 0)");
              stmt.setString(1, name);
              stmt.setString(2, email);
              stmt.setString(3, password);

              if(stmt.executeUpdate() > 0){
                User user = new User(name, email, password, false);
                request.getSession().setAttribute("user", user);
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
                request.getSession().setAttribute("user", user);
                
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
                User user = new User(rs.getInt("IdUser"), rs.getString("Name"),rs.getString("Email"), rs.getString("Password"), rs.getBoolean("Type"));
                
                request.getSession().setAttribute("user", user);
                
                rs.close();
                stmt.close();
                return;
              }
              rs.close();
              stmt.close();

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
            }
        }
    }
}