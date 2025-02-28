<%-- 
    Document   : listcourse
    Created on : Nov 28, 2020, 4:44:54 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.gacha.universitycoursemanagement.Courses" %>
<!DOCTYPE html>
<html>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <%-- BOOTSTRAP, CSS, FONTAWESOME --%>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        
        <title>Courses | Smart Learn System</title>
    <body>
        <%
            String user_id = (String) session.getAttribute("user_id");
            
            ArrayList<Courses> list = new ArrayList<Courses>();
            
            list = (ArrayList<Courses>) session.getAttribute("courseList");
            Courses courseObj = new Courses();
            
            if (user_id == null) { response.sendRedirect("login.jsp"); }
        %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-its mb-md-5">
            <div class="container">
                <a class="navbar-brand" href="index.jsp"><i class="fas fa-university fa-lg"></i> Smart Learn</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <%
                            if (user_id != null) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="HomeController">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="CourseController">Course</a>
                        </li>
                        <% } %>
                    </ul>
                    <ul class="navbar-nav">
                        <%
                            if (user_id == null) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link active" href="login.jsp">Login <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>
                        <%
                            }
                            else
                            {
                        %>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <%= user_id %>
                            </a>
                            <div class="dropdown-menu fade" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">My Profile</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="LogoutController">Logout</a>
                            </div>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>
        
        <div class="container mt-md-5">
            <%
                    // show errors if any exist
                    String errMsg = (String) session.getAttribute("error");
                    if (errMsg != null) {
                %>
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    Error: <%= errMsg%>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%
                    session.removeAttribute("error");
                }
                %>
                <%
                    // show errors if any exist
                    String successMsg = (String) session.getAttribute("success");
                    if (successMsg != null) {
                %>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <%= successMsg%>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%
                    session.removeAttribute("success");
                }
                %>
            <h1 class="text-center">List of Courses Available</h1>
        </div>
        
        <div class="container mt-md-5">
            <div class="row">
                <%
                    for(int i = 0; i < list.size(); i++)
                    {
                        courseObj = list.get(i);
                %>
                <div class="col-md-3 d-flex align-items-stretch">
                    <div class="card card-custom text-center">
                        <img class="card-img-top" src="https://picsum.photos/seed/webpro/350/200?random=4" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%= courseObj.getCourseName()%></h5>
                            <p class="card-text text-truncate"><%= courseObj.getCourseDesc()%></p>
                        </div>
                        <div class="card-footer">
                            <a href="#" class="btn btn-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        
        <%-- BOOTSTRAP JAVASCRIPT--%>
        <script src="./js/app.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
