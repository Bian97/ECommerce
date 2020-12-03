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
                return true;
              } 
              out.println("<script type=\"text/javascript\">");
              out.println("alert('Usuário e/ou senha inválido(s)!');");
              out.println("</script>");
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
    
    public boolean Register(User user, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("insert into user (Name, Email, Password, Type) values (?, ?, ?, 0)");
              stmt.setString(1, user.getName());
              stmt.setString(2, user.getEmail());
              stmt.setString(3, user.getPassword());

              if(stmt.executeUpdate() > 0){
                user.setType(false);
                stmt.close();
                request.getSession().setAttribute("user", user);
                return true;
              }
              out.println("Erro no Registro!");              
              stmt.close();
              return false;

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
                return false;
            }
        } else {
            out.println("Erro de Conexão!!");
            return false;
        }
    }
    
    public boolean ChangePassword(User user, HttpServletResponse response, PrintWriter out, HttpServletRequest request){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("UPDATE user SET Password = ? WHERE Email LIKE '%"+user.getEmail()+"%'");
              stmt.setString(1, user.getPassword());
              
              if(stmt.executeUpdate() > 0){
                  stmt.close();
                  return true;
              }
              stmt.close();
              out.println("E-mail não cadastrado!");
              return false;

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
                return false;
            }
        }
        return false;
    }
    
    public boolean EditAccount(User user, HttpServletResponse response, PrintWriter out, HttpServletRequest request){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {
              var stmt = dao.createPreparedStatement("UPDATE user SET Name = ?, Password = ?, Email = ? WHERE Email LIKE '%"+user.getEmail()+"%'");
              stmt.setString(1, user.getName());
              stmt.setString(2, user.getPassword());
              stmt.setString(3, user.getEmail());
              
              if(stmt.executeUpdate() > 0){
                stmt.close();
                request.getSession().setAttribute("user", user);
                return true;
              }
              stmt.close();
              out.println("Alteração com erro!");
              return false;

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
                return false;
            }
        }
        return false;
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
    public boolean RemoveUser(User user, HttpServletResponse response, PrintWriter out, HttpServletRequest request){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("delete from user WHERE Email LIKE '%"+user.getEmail()+"%'");
              
              if(stmt.executeUpdate() > 0){
                  request.getSession().setAttribute("user", null);
                  stmt.close();
                  return true;
              }
              stmt.close();
              return false;
            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
                return false;
            }
        }
        return false;
    }
}