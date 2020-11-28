/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.gacha.universitycoursemanagement;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author micha
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
                    try
                    {   
                        ArrayList<Courses> courseResult = new ArrayList<>();
                        ArrayList<Attendance> attnResult = new ArrayList<>();

                        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/universitycoursemanagement" ,"universitycoursemanagement", "university");

                        PreparedStatement course = conn.prepareStatement("SELECT * FROM courses");
                        ResultSet courseList = course.executeQuery();
                        
                        int count = 0;
                        
                        while(courseList.next())
                        {
                            Courses courses = new Courses(courseList.getInt("course_id"), courseList.getString("course_name"), courseList.getString("course_desc"));
                            courseResult.add(courses);
                            count++;
                        }
                        courseList.close();
                        
                        String user_id = (String) request.getSession().getAttribute("id_user").toString();
                        Connection conn2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/universitycoursemanagement" ,"universitycoursemanagement", "university");
                        PreparedStatement course2 = conn2.prepareStatement("SELECT courses.course_id, course_name, course_desc, isFinished FROM courses JOIN attendances ON courses.course_id = attendances.course_id WHERE user_id = ?");
                        //SELECT courses.course_id, course_name, course_desc, isFinished FROM courses JOIN attendances ON courses.course_id = attendances.course_id
                        course2.setString(1, user_id);
                        courseList = course2.executeQuery();
                        
                        int count2 = 0;
//                        System.out.println(course2);
                        
                        while(courseList.next())
                        {
                            Attendance attn = new Attendance(courseList.getInt("course_id"), courseList.getString("course_name"), courseList.getString("course_desc"), courseList.getBoolean("isFinished"));
                            attnResult.add(attn);
                            count2++;
                        }

//                        System.out.println(count);
//                        System.out.println(count2);
                       
                        request.getSession().setAttribute("countCourse", count);
                        request.getSession().setAttribute("countAttn", count2);
                        request.getSession().setAttribute("attnList", attnResult);
                        //request.getSession().setAttribute("courseList", courseResult);
                        response.sendRedirect("home.jsp");
                        return;
                    }
                    catch(Exception e)
                    {
                        request.getSession().setAttribute("error", "Something went wrong: "+ e);
                        response.sendRedirect("home.jsp");
                        return;
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
