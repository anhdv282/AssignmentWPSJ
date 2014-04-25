/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.AccountDAL;

/**
 *
 * @author DucNM
 */
public class LoginController extends HttpServlet {

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
        String action = request.getParameter("action");
        if ("login".equalsIgnoreCase(action)) {
            String name = request.getParameter("username");
            String pass = request.getParameter("password");
            AccountDAL dp = new AccountDAL();
            if (dp.checkLogin(name, pass)) {
                String check = request.getParameter("loginkeeping");
                if (check != null) {
                    Cookie cookie = new Cookie("username", name);
                    cookie.setMaxAge(30 * 24 * 60 * 60);
                    response.addCookie(cookie);
                }
                HttpSession session = request.getSession();
                session.setAttribute("username", name);
                response.sendRedirect("clientSide/Home.jsp");
            } else {
                response.sendRedirect("Error.jsp");
            }
        }
        if ("logout".equalsIgnoreCase(action)) {
            Cookie cookie = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equalsIgnoreCase("username")) {
                        cookie = cookies[i];
                        break;
                    }
                }
            }
            HttpSession session = request.getSession();
            session.setAttribute("username", null);
            if (cookie != null) {
                cookie.setMaxAge(0);
                response.addCookie(cookie);
            }
            response.sendRedirect("clientSide/Home.jsp");
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
