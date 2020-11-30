package servlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.DaoCart;
import dao.DaoProduct;
import dao.DaoUser;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cart;
import model.Product;
import model.User;

/**
 *
 * @author Bian
 */
@WebServlet(name = "Cart", urlPatterns = {"/Cart"})
public class CartServlet extends HttpServlet {

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
            DaoCart daoCart = new DaoCart();
            DaoUser daoUser = new DaoUser();
            
            if(action.equals("load")){
                var email = ((User)request.getSession().getAttribute("user")).getEmail();
                daoUser.SearchUser(email, response, out, request);
                daoCart.GetCart(((User)request.getSession().getAttribute("user")).getId(),response, request, out);
                response.sendRedirect(request.getContextPath() + "/cart.jsp");
            } else if(action.equals("add")) {                
                Cart cart = new Cart(0,(Product)request.getSession().getAttribute("product"), (User)request.getSession().getAttribute("user"), Integer.parseInt(request.getParameter("quantity")), false);
                daoCart.GetCart(((User)request.getSession().getAttribute("user")).getId(), response, request, out);
                if(((Cart)request.getSession().getAttribute("cart")) != null){
                   daoCart.DeleteCart(((User)request.getSession().getAttribute("user")).getId(), response, request, out);
                }
                if(daoCart.AddCart(cart, response, request, out)){
                    daoCart.GetCart(((User)request.getSession().getAttribute("user")).getId(), response, request, out);
                    response.sendRedirect(request.getContextPath() + "/cart.jsp");
                }
            } else if(action.equals("remove")){
                    daoCart.DeleteCart(((User)request.getSession().getAttribute("user")).getId(), response, request, out);
                    response.sendRedirect(request.getContextPath() + "/cart.jsp");
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
