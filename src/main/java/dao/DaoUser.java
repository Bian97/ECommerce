/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bian
 */
public class DaoUser {   
    public boolean Login(String user, String password, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {    
              dao.createPreparedStatement("select * from user where Name=? and Password=?");
              dao.setString(1, user);
              dao.setString(2, password);
              ResultSet rs = dao.executeQuery();              
              if(rs.next())
              {
                rs.close();
                dao.close();
                //request.getSession().setAttribute("user",request.getParameter("user"));
                out.println("Usuário logado");
                return true;
              }             
              out.println("Usuário e/ou senha inválido");              
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
    
    public void Register(String user, String email, String password, HttpServletResponse response){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {
                PrintWriter out = response.getWriter();
                try
                {  
                  var stmt = dao.createPreparedStatement("insert into user (Name, Email, Password, Type) values (?, ?, ?, 0)");
                  stmt.setString(1, user);
                  stmt.setString(2, email);
                  stmt.setString(3, password);

                  if(stmt.executeUpdate() > 0){
                    out.println("<html><body><b>"+user+" Inserido com sucesso"
                            + "</b></body></html>"); 
                  } else{
                      out.println("Erro no Registro!");
                  }

                  stmt.close();

                }  catch(Exception e){
                    out.println("Erro: " + e.getMessage());
                }
            } catch(IOException e){
                
            }
        }
    }
}
