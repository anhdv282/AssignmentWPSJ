/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package control;

import entity.Cart;
import entity.Product;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DataClass;

/**
 *
 * @author DucNM
 */
public class CartController extends HttpServlet {

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
        if ("add".equalsIgnoreCase(action)) {
            String id = request.getParameter("id");
            DataClass dp = new DataClass();
            Product p = dp.getByID(Integer.parseInt(id));
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            cart.addProduct(p);
            session.setAttribute("cart", cart);
            response.sendRedirect("clientSide/ViewCart.jsp");
        }
        if ("del".equalsIgnoreCase(action)) {
            String id = request.getParameter("id");
            DataClass dp = new DataClass();
            Product p = dp.getByID(Integer.parseInt(id));
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
            }
            cart.removeProduct(p);
            session.setAttribute("cart", cart);
            response.sendRedirect("clientSide/ViewCart.jsp");
        }
        if ("edit".equalsIgnoreCase(action)) {
            String[] ids= request.getParameterValues("id");
            String[] quantities= request.getParameterValues("quantity");
            DataClass dp = new DataClass();
            HttpSession session= request.getSession();
            Cart cart= (Cart) session.getAttribute("cart");
            List<Product> products = new ArrayList<>();
            for (int i = 0; i < ids.length; i++) {
                Product p = dp.getByID(Integer.parseInt(ids[i]));
                products.add(p);
            }
            cart.updateCart(products, quantities);
            session.setAttribute("cart", cart);
            response.sendRedirect("clientSide/ViewCart.jsp");
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
