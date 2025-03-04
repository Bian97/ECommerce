package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.DaoCart;
import dao.DaoOrder;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.sql.Date;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Order;
import model.User;

/**
 *
 * @author Bian
 */
@WebServlet(name = "Order", urlPatterns = {"/Order"})
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            DaoOrder daoOrder = new DaoOrder();

            if(action.equals("load")){
                daoOrder.SelectOrders(((User)request.getSession().getAttribute("user")), response, request, out);
                response.sendRedirect(request.getContextPath() + "/order.jsp");
            } else if (action.equals("buy")){
                Date date = new java.sql.Date((new java.util.Date()).getTime());
                DaoCart daoCart = new DaoCart();
                Cart cart = (Cart)request.getSession().getAttribute("cart");
                int quantity = Integer.parseInt(request.getParameter("cartQuantity"));
                cart.setQuantity(quantity);

                daoCart.BuyProduct(cart, response, request, out);
                Order order = new Order(0, cart, date, "Finalizado");
                request.getSession().setAttribute("cart", null);
                
                if(daoOrder.AddOrder(order, response, request, out)){
                    response.sendRedirect(request.getContextPath() + "/Order?action=load");
                }
            } else if (action.equals("select")){
                daoOrder.SelectOrder(Integer.parseInt(request.getParameter("id")), response, request, out);
                response.sendRedirect(request.getContextPath() + "/details-order.jsp");
            } else if (action.equals("loadAdmin")){
                daoOrder.ListAdminOrders(response, request, out);
                response.sendRedirect(request.getContextPath() + "/admin-orders.jsp");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
