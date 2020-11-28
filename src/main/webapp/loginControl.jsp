<%-- 
    Document   : loginControl
    Created on : Nov 28, 2020, 12:47:12 PM
    Author     : micha
--%>

<%@ page language="java" contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*, java.lang.*"%>
<%
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
            
            if(isPasswordCorrect)
            {
                out.println("Authenticated");
            }
            else
            {
                out.println("Password is incorrect");
            }
        }
        else
        {
            out.println("Credentials are incorrect");
        }
    }
    catch(Exception e)
    {       
        out.println("Something went wrong !! Please try again");       
    }      
    
    
        
%>
