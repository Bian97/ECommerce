/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author Bian
 */
public class DaoOrder {
    public boolean AddOrder(Order order, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {
              var stmt = dao.createPreparedStatement("insert into `order` (CartId, Date, Status) values (?, ?, ?)");
              stmt.setInt(1, order.getCart().getId());
              stmt.setDate(2, order.getDate());
              stmt.setString(3, order.getStatus());

              if(stmt.executeUpdate() > 0){
                stmt.close();
                return true;
              } else{
                  out.println("Erro no Registro!");
                  stmt.close();
                  return false;
              }              

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage() + " " + e.toString());
                return false;
            }
        } else {
            out.println("Erro de Conexão!!");
            return false;
        }
    }
    
    public void SelectOrders(User user, HttpServletResponse response, HttpServletRequest request, PrintWriter out){
        Dao dao = new Dao();
        if(dao.connect())
        {
            try
            {
              var stmt = dao.createPreparedStatement("select ord.IdOrder, ord.CartId, ord.Date, ord.Status, car.Quantity, car.ProductId, prod.Name, prod.Price, prod.Description, prod.ImagePath, user.IdUser from placeholder.order ord INNER JOIN placeholder.cart car ON ord.CartId = car.IdCart AND car.IsFinished = 1 JOIN placeholder.user user ON car.UserId = user.IdUser AND user.IdUser = ? JOIN placeholder.product prod ON prod.IdProduct = car.ProductId");
              stmt.setInt(1, user.getId());

              ResultSet rs = stmt.executeQuery();
              List<Order> orders = new ArrayList<>();
              while(rs.next())
              {
                Order order = new Order(rs.getInt("IdOrder"), new Cart(rs.getInt("CartId"), 
                        new Product(rs.getInt("ProductId"), rs.getString("Name"), rs.getDouble("Price"), rs.getString("Description"), rs.getString("ImagePath")),
                new User(rs.getInt("IdUser"), null, null, null, false),rs.getInt("Quantity"),true),
                        rs.getDate("Date"),rs.getString("Status"));
                orders.add(order);
              }
              rs.close();
              stmt.close();
              request.getSession().setAttribute("orders", orders);

            }  catch(Exception e){
                out.println("Erro: " + e.getMessage());
            }
        } else {
            out.println("Erro de Conexão!!");
        }
    }
}