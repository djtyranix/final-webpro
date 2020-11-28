<%-- 
    Document   : home
    Created on : Nov 28, 2020, 4:02:14 PM
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.gacha.universitycoursemanagement.Attendance" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home | Smart Learn System</title>
        
        <%-- BOOTSTRAP, CSS, FONTAWESOME --%>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        
    </head>
    <body>
        <%
            String user_id = (String) session.getAttribute("user_id");
            String count = (String) session.getAttribute("countCourse").toString();
            String count2 = (String) session.getAttribute("countAttn").toString();
            
            ArrayList<Attendance> attn = new ArrayList<Attendance>();
            
            attn = (ArrayList<Attendance>) session.getAttribute("attnList");
            Attendance attnObj = new Attendance();
            
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
                            <a class="nav-link active" href="HomeController">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="CourseController">Course</a>
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
        <div Class="container">
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
            <div Class="row">
                <div Class="col-md-9">
                    <div Class="card card-custom">
                        <div Class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="vertical-line container"><h1 style="margin-bottom: 0;">Hello, <strong><%= user_id%></strong></h1></div>
                                </div>
                                <div class="col-md-3">
                                    <div class="vertical-line container">
                                        <div style="text-align: center; line-height: 0;">
                                            <h2><%= count2%></h2>
                                        </div>
                                        <div style="text-align: center; line-height: 0;">
                                            <p class="card-text">Enrolled Course</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="container">
                                        <div style="text-align: center; line-height: 0;">
                                            <h2><%= count%></h2>
                                        </div>
                                        <div style="text-align: center; line-height: 0;">
                                            <p class="card-text">Available Course</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container mt-md-3">
                        <h2>Stay on <strong>your track!</strong></h2>
                    </div>
                    <div class="container mt-md-3">
                        <div class="row">
                            <%
                                for(int i = 0; i < attn.size(); i++)
                                {
                                    attnObj = attn.get(i);
                                    if(attnObj.getIsFinished() == true)
                                    { continue ;}
                                    else
                                    {
                            %>
                            <div class="col-md-4 d-flex align-items-stretch">
                                <div class="card card-custom mb-md-5">
                                    <img class="card-img-top" src="https://picsum.photos/seed/nada/350/200" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title"><%= attnObj.getCourseName()%></h4>
                                    </div>
                                </div>
                            </div>
                            <% }} %>
                        </div>
                    </div>
                </div>
                <div Class="col-md-3">
                    <div class="card card-custom">
                        <div class="card-header">
                            Enrolled Courses
                        </div>
                        <div class="card-body">
                            <% 
                                if(attn.size() != 0)
                                {
                                    for(int i = 0; i < attn.size(); i++)
                                    {
                                        attnObj = attn.get(i);
                            %>
                            <div class="courseListMenu mb-2">
                                - <%= attnObj.getCourseName() %>
                            </div>
                            <% 
                                }}
                                else
                                {
                            %>
                            <div class="courseListMenu mb-2">
                                No class enrolled.
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <div class="card card-custom mt-md-3">
                        <div class="card-header"
                             >
                            Finished Courses
                        </div>
                        <div class="card-body">
                            <% 
                                if(attn.size() != 0)
                                   {
                                    for(int i = 0; i < attn.size(); i++)
                                    {
                                        attnObj = attn.get(i);
                                        if(attnObj.getIsFinished() == true)
                                        {
                            %>
                            <div class="courseListMenu mb-2">
                                - <%= attnObj.getCourseName() %>
                            </div>
                            <%
                                }
                                else
                                {
                                    continue;
                                }}}
                                else
                                {
                            %>
                            <div class="courseListMenu mb-2">
                                No class completed.
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
           </div>
        </div>            
        
                    
        <%-- BOOTSTRAP JAVASCRIPT--%>
        <script src="./js/app.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
