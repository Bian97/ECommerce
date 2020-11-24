/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Product;
import model.User;

/**
 *
 * @author Bian
 */
public class DaoCart {
    public boolean AddCart(Cart cart, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              out.println("Usuário: " + cart.getUser().getId());
              out.println("Produto: " + cart.getProduct().getId());
              var stmt = dao.createPreparedStatement("insert into cart (ProductId, UserId, Quantity) values (?, ?, ?)");
              stmt.setInt(1, cart.getProduct().getId());
              stmt.setInt(2, cart.getUser().getId());
              stmt.setInt(3, cart.getQuantity());

              if(stmt.executeUpdate() > 0){                    
                /*out.println("<html><body><b> Item adicionado no carrinho"
                        + "</b></body></html>");*/
                return true;
              } else{
                  out.println("Erro no Registro!");
                  stmt.close();
                  return false;
              }              

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
                return false;
            }
        } else {
            out.println("Erro de Conexão!!");
            return false;
        }
    }
    
    public void UpdateProduct(Cart cart, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("update cart set Quantity = ? where UserId = ?");
              stmt.setInt(1, cart.getQuantity());
              stmt.setInt(2, cart.getUser().getId());

              if(stmt.executeUpdate() > 0){                    
                out.println("<html><body><b> Carrinho atualizado com sucesso"
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
    
    public void DeleteCart(int id, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {  
              var stmt = dao.createPreparedStatement("delete from cart where UserId = ?");
              stmt.setInt(1, id);

              if(stmt.executeUpdate() > 0){                    
                /*out.println("<html><body><b> Carrinho apagado com sucesso!"
                        + "</b></body></html>");*/
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
    public void GetCart(int id, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            { 
              Cart cart = null;
              var stmt = dao.createPreparedStatement("Select * from cart where UserId = ?");
              stmt.setInt(1, id);

              ResultSet rs = stmt.executeQuery();

              if(rs.next())
              {
                cart = new Cart(new Product(rs.getInt("UserId"), null, 0, null, null), new User(rs.getInt("ProductId"), null, null, null), rs.getInt("Quantity"));                
              }
              rs.close();
              stmt.close();
              DaoProduct daoProduct = new DaoProduct();
              cart.setProduct(daoProduct.GetProductById(cart.getProduct().getId(), out));
              
              request.getSession().setAttribute("cart", cart);
                                          
              //response.sendRedirect(request.getContextPath() + "/products.jsp");
            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
            }
        } else {
            out.println("Erro de Conexão!!");
        }
    }
}