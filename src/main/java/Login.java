/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dao.Dao;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bian
 */
@WebServlet(name="Login",urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try{
                Dao dao= new Dao();
                if(dao.connect())
                {
                    String user= request.getParameter("user");
                    out.println("Nome: " + user);
                    if(user == null)
                    {
                        response.setStatus(404);
                    }

                    try
                      {    
                        dao.createPreparedStatement("select * from user where Name=? and Password=?");
                        dao.setString(1, request.getParameter("user"));
                        dao.setString(2, request.getParameter("password"));
                        ResultSet rs=dao.executeQuery();
                        if(rs.next())
                        {
                            request.getSession().setAttribute("user",request.getParameter("user"));
                            out.println("Usuário logado");
                        }
                        else
                        {    
                         out.println("Usuário e/ou senha inválido");                     
                        }
                        rs.close();
                        dao.close();
                      }
                      catch(Exception e)
                      {
                          throw e;
                      } 

                }
            } catch(Exception e){
                out.println(e.getMessage());
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
