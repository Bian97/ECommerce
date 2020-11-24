/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.DaoUser;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Bian
 */
@WebServlet(name="User", urlPatterns = {"/User"})
public class UserServlet extends HttpServlet {

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
            DaoUser daoUser = new DaoUser();
            if(action.equals("load")){  
                if(((User)request.getSession().getAttribute("user")).getEmail() != null){
                    out.println(((User)request.getSession().getAttribute("user")).getEmail());
                    daoUser.SearchUser(((User)request.getSession().getAttribute("user")).getEmail(), response, out, request);
                    response.sendRedirect(request.getContextPath() + "/edit-account.jsp");
                }
            } else if(action.equals("login")){
                String name = request.getParameter("name");
                String password = request.getParameter("password");
 
                if(daoUser.Login(name, password, out, request, response)){
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                } else {
                    //Colocar alert de usuário não cadastrado
                    response.sendRedirect(request.getContextPath() + "/account.jsp");
                }
            } else if(action.equals("register")){
                User user = new User(request.getParameter("name"),request.getParameter("email"),request.getParameter("password"));
                if(daoUser.Register(user, response, request, out)){
                    response.sendRedirect(request.getContextPath() + "/account.jsp");
                } else {
                    response.setStatus(404);
                }
                
            } else if(action.equals("edit")){
                User user = new User(request.getParameter("name"),request.getParameter("email"),request.getParameter("password"));
                
                if(daoUser.EditAccount(user, response, out, request)){
                    response.sendRedirect(request.getContextPath() + "/edit-account.jsp");
                } else {
                    response.setStatus(404);
                }
            } else if(action.equals("changePassword")){
                User user = new User(request.getParameter("email"),request.getParameter("password"));
                if(daoUser.ChangePassword(user, response, out, request)){
                    response.sendRedirect(request.getContextPath() + "/account.jsp");
                } else {
                    response.setStatus(404);
                }
            } else if(action.equals("remove")){
                User user = new User(request.getParameter("name"),request.getParameter("email"),request.getParameter("password"));
                if(daoUser.RemoveUser(user, response, out, request)){
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                } else {
                    response.setStatus(404);
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
