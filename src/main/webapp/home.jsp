<%-- 
    Document   : home
    Created on : Nov 28, 2020, 4:02:14 PM
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                            <a class="nav-link active" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="courses.jsp">Course</a>
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
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
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
                                    <div class="vertical-line container"><h1>Hello, <strong><%= user_id%></strong></h1></div>
                                </div>
                                <div class="col-md-3">
                                    <div class="vertical-line container">
                                        <div style="text-align: center; line-height: 0;">
                                            <h2>12</h2>
                                        </div>
                                        <div style="text-align: center; line-height: 0;">
                                            <p class="card-text">Enrolled Course</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="container">
                                        <div style="text-align: center; line-height: 0;">
                                            <h2>50</h2>
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
                            <div class="col-md-4">
                                <div class="card card-custom">
                                    <img class="card-img-top" src="https://picsum.photos/seed/nada/350/200" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Materi 1</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-custom">
                                    <img class="card-img-top" src="https://picsum.photos/seed/mike/350/200" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Materi 2</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-custom">
                                    <img class="card-img-top" src="https://picsum.photos/seed/gatau/350/200" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Materi 3</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row mt-md-4">
                            <div class="col-md-4">
                                <div class="card card-custom">
                                    <img class="card-img-top" src="https://picsum.photos/seed/siapa/350/200" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Materi 4</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-custom">
                                    <img class="card-img-top" src="https://picsum.photos/seed/lagi/350/200" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Materi 5</h4>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="card card-custom">
                                    <img class="card-img-top" src="https://picsum.photos/seed/dah/350/200" alt="Card image cap">
                                    <div class="card-body">
                                        <h4 class="card-title">Materi 6</h4>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div Class="col-md-3">
                    <div class="card card-custom">
                        <div class="card-header">
                            Courses
                        </div>
                        <div class="card-body">
                            <div class="courseListMenu mb-2">
                                Course 1
                            </div>
                            <div class="courseListMenu mb-2">
                                Course 2
                            </div>
                            <div class="courseListMenu mb-2">
                                Course 3
                            </div>
                            <div class="courseListMenu mb-2">
                                Course 4
                            </div>
                            <div class="courseListMenu mb-2">
                                Course 5
                            </div>
                            <div style="float: right;">
                                View All
                            </div>
                        </div>
                    </div>
                    <div class="card card-custom mt-md-3">
                        <div class="card-header"
                             >
                            Finished Courses
                        </div>
                        <div class="card-body">
                            <div class="courseListMenu mb-2">
                                Course 1
                            </div>
                            <div class="courseListMenu mb-2">
                                Course 2
                            </div>
                            <div class="courseListMenu mb-2">
                                Course 3
                            </div>
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
