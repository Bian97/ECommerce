/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.DaoProduct;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import model.User;

/**
 *
 * @author Bian
 */
@WebServlet(name = "Product", urlPatterns = {"/Product"})
public class ProductServlet extends HttpServlet {

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
            DaoProduct daoProduct = new DaoProduct();
            
            if(action.equals("load")){
                daoProduct.ListProducts(response, request, out);
                response.sendRedirect(request.getContextPath() + "/products.jsp");
            } else if (action.equals("save")) {
                String name = request.getParameter("name");
                double price = Double.parseDouble(request.getParameter("price"));
                String description = request.getParameter("description");
                String imagePath = null;
                Product product = new Product(name, price, description, imagePath);
                if(daoProduct.AddProduct(product, response, request, out)){
                    response.sendRedirect(request.getContextPath() + "/Product?action=load");
                }
            } else if(action.equals("select")){
                if((User)request.getSession().getAttribute("user") != null){
                    int id = Integer.parseInt(request.getParameter("id"));
                    request.getSession().setAttribute("product", daoProduct.GetProductById(id, out));
                    response.sendRedirect(request.getContextPath() + "/product-details.jsp");
                } else {
                    response.sendRedirect(request.getContextPath() + "/account.jsp");
                }
            } else if(action.equals("loadDetails")){
                if((User)request.getSession().getAttribute("user") != null){
                    int id = Integer.parseInt(request.getParameter("id"));
                    request.getSession().setAttribute("product", daoProduct.GetProductById(id, out));
                    response.sendRedirect(request.getContextPath() + "/operate-product.jsp?action=loadDetails");
                } else {
                    response.setStatus(404);
                }
            } else if(action.equals("update")){
                Product product = ((Product)request.getSession().getAttribute("product"));
                product = new Product(product.getId(), request.getParameter("name"), Double.parseDouble(request.getParameter("price")), request.getParameter("description"), null);
                if(daoProduct.UpdateProduct(product, response, request, out)){
                    response.sendRedirect(request.getContextPath() + "/Product?action=load");
                }
            } else if (action.equals("remove")){
                int id = Integer.parseInt(request.getParameter("id"));
                if(daoProduct.DeleteProduct(id, response, request, out)){
                    response.sendRedirect(request.getContextPath() + "/Product?action=load");
                }
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
