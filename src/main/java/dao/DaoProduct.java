/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Bian
 */
public class DaoProduct {
    public void AddProduct(Product product, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("insert into product (Name, Price, Description, ImagePath) values (?, ?, ?, ?)");
              stmt.setString(1, product.getName());
              stmt.setDouble(2, product.getPrice());
              stmt.setString(3, product.getDescription());
              stmt.setString(4, product.getImagePath());

              if(stmt.executeUpdate() > 0){                    
                out.println("<html><body><b>"+product.getName()+" Inserido com sucesso"
                        + "</b></body></html>");
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
    
    public void UpdateProduct(Product product, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("update product set Name = ?, Price = ?, Description = ?, ImagePath = ? where IdProduct = ?");
              stmt.setString(1, product.getName());
              stmt.setDouble(2, product.getPrice());
              stmt.setString(3, product.getDescription());
              stmt.setString(4, product.getImagePath());
              stmt.setInt(5, product.getId());

              if(stmt.executeUpdate() > 0){                    
                out.println("<html><body><b>"+ product.getName()+" Atualizado com sucesso"
                        + "</b></body></html>");
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
    
    public void DeleteProduct(int id, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("delete from product where IdProduct = ?");
              stmt.setInt(1, id);

              if(stmt.executeUpdate() > 0){                    
                out.println("<html><body><b> Produto apagado com sucesso!"
                        + "</b></body></html>");
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
}