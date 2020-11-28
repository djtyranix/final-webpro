<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Smart Learn System | Your gateway to a better future</title>
        
        <%-- BOOTSTRAP, CSS, FONTAWESOME --%>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-its mb-md-5">
            <div class="container">
                <a class="navbar-brand" href="index.jsp"><i class="fas fa-university fa-lg"></i> Smart Learn</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <%
                            String user_id = (String) session.getAttribute("user_id");
                            if (user_id != null) {
                                response.sendRedirect("home.jsp");
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="index.jsp">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Course</a>
                        </li>
                        <% } %>
                    </ul>
                    <ul class="navbar-nav">
                        <%
                            if (user_id == null) {
                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
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
                                <a class="dropdown-item" href="#">Logout</a>
                            </div>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>                    
        <div class="container bg-white mb-5">
            <div class="row">
                <div class="col-md-7 p-5" style="margin-top: 2.5rem">
                    <h1 class="head-landing">Advance your skills</h1>
                    <h2 class="head-landing">with <span>Smart Learn</span>.</h2>
                    <a class="btn btn-primary button-its px-5 button-rounded mt-4" style="font-size: 1.25rem" href="register.jsp">Start Now</a>
                </div>
                <div class="col-md-5">
                    <a href='https://www.freepik.com/free-vector/man-shows-gesture-great-idea_10541562.htm'><img style="width: 30rem" src="./assets/landing-page-gambar.jpg" alt="alt"/></a>
                </div>
            </div>
        </div>  
        
        <div class="container mb-5">
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
            <h2 class="mb-2 course-landing">Featured Courses</h2>
            <div class="row pt-3">
                <div class="col-md-3">
                    <div class="card card-custom text-center">
                        <img class="card-img-top" src="https://picsum.photos/seed/anjayani/350/200" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>

                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-custom text-center">
                        <img class="card-img-top" src="https://picsum.photos/seed/aheheheh/350/200" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card card-custom text-center">
                        <img class="card-img-top" src="https://picsum.photos/seed/pwebwkwkwk/350/200" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">Card title</h5>
                            <a href="#" class="btn btn-primary">Go somewhere</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
                    
        <footer>
            <hr>
            <div class="container">
                <p>Smart Learn</p>
            </div>             
        </footer>
        <%-- BOOTSTRAP JAVASCRIPT--%>
        <script src="./js/app.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
