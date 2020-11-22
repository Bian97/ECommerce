/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.PrintWriter;
import java.sql.ResultSet;

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
    
    public void Register(){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
                
            } catch(Exception e){
                
            }
        }
    }
}
