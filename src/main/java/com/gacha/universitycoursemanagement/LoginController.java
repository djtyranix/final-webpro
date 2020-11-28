/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gacha.universitycoursemanagement;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author micha
 */
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
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
        try
        {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/universitycoursemanagement" ,"universitycoursemanagement", "university");

            PreparedStatement checkPass = conn.prepareStatement("SELECT email, user_name, password_hash FROM users WHERE email=?");
            checkPass.setString(1, email);
            ResultSet curPass = checkPass.executeQuery();
            if(curPass.next())
            {
                String stored_hash = curPass.getString("password_hash");

                boolean isPasswordCorrect = BCrypt.checkpw(password, stored_hash);

                if(isPasswordCorrect) // Logged in
                {
                    request.getSession().setAttribute("success", "Successfully logged in.");
                    request.getSession().setAttribute("user_id", curPass.getString("user_name"));
                    request.getRequestDispatcher("HomeController").forward(request, response);
                    return;
                }
                else //Wrong password.
                {
                    request.getSession().setAttribute("error", "Email and password combination is incorrect!");
                    response.sendRedirect("login.jsp");
                    return;
                }
            }
            else // Credentials incorrect
            {
                request.getSession().setAttribute("error", "Email or password not found!");
                response.sendRedirect("login.jsp");
                return;
            }
        }
        catch(Exception e)
        {       
            request.getSession().setAttribute("error", "Something went wrong: "+ e);
            response.sendRedirect("login.jsp");
            return;
        }
        finally
        {
            try{} catch(Exception e){}
            try{} catch(Exception e){}
            try{} catch(Exception e){}
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
