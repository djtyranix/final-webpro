<%-- 
    Document   : login
    Created on : Nov 27, 2020, 8:57:25 PM
    Author     : micha
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
        <%-- BOOTSTRAP, CSS, FONTAWESOME --%>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
        <link rel="stylesheet" href="./css/style.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
        
        <title>Login | Smart Learn System</title>
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
                                <a class="dropdown-item" href="#">Logout</a>
                            </div>
                        </li>
                        <% } %>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="row m-md-5">
            <div class="container">
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
                <div class="col-md-12">
                    <div class="card card-shadow">
                        <div class="card-header bg-its text-its">
                            <h4 class="m-2">Login</h4>
                        </div>
                        <div class="card-body">
                            <form action="LoginController" method="POST">
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" id="email" name="email" placeholder="Enter your email" required maxlength="256">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <input type="password" class="form-control" id="password" name="password" placeholder="Enter your password" required maxlength="256">
                                </div>
                                <button type="submit" class="btn btn-primary button-its px-5 button-rounded mt-2">Login</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <%-- BOOTSTRAP JAVASCRIPT--%>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-LtrjvnR4Twt/qOuYxE721u19sVFLVSA4hf/rRt6PrZTmiPltdZcI7q7PXQBYTKyf" crossorigin="anonymous"></script>
    </body>
</html>
