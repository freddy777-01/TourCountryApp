<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
response.addHeader("Pragma","no-cache"); //HTTP 1.0
response.addDateHeader ("Expires", 0); //prevent caching at the proxy server
if(session.getAttribute("user") == null){
	//response.sendRedirect(request.getContextPath()+"/");
	request.getRequestDispatcher("TtourApp/").forward(request, response);
}
%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="tTour.model.Region" %>
<%@ page import="tTour.dao.RegionDAO" %>

<html>
<head>
<meta charset="ISO-8859-1">
<title>${user.getUserType()}</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/main.css"/>
<link rel="icon" href="images/tFlag.png">
</head>
<body class="bg-light">
<!-- Navigation bar -->
<nav class="container navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
     <a class="navbar-brand fw-bold text-black" href="index.jsp">
    <img src="images/tFlag.png" class="brand-img"/>
    Light Tour
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" href="#">Link</a>
        </li>
        <li class="nav-item">
          <a class="nav-link disabled">Disabled</a>
        </li>
      </ul>
      <form action="RouteServlet" class="d-flex" method="post">
      <input type="hidden" name="action" value="logout">
        <button class="btn btn-outline-secondary" type="submit">Logout</button>
      </form>
    </div>
  </div>
</nav>

<main class="container">

<h2 class="my-3 bg-infor text-center text-secondary"> ${user.getName()}</h2>

<div class="alert alert-dismissible alert-warning fade show">
  <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
  <strong>Alert!</strong> <span class="w-25 mx-auto text-warning h4">${msg}</span>.
</div>

<section class="border rounded p-3">
<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
  <li class="nav-item" role="presentation">
    <button class="nav-link active" id="pills-home-tab" data-bs-toggle="pill" data-bs-target="#pills-home" type="button" role="tab" aria-controls="pills-home" aria-selected="true">User</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-profile-tab" data-bs-toggle="pill" data-bs-target="#pills-profile" type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Region</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-contact-tab" data-bs-toggle="pill" data-bs-target="#pills-contact" type="button" role="tab" aria-controls="pills-contact" aria-selected="false">Council</button>
  </li>
  <li class="nav-item" role="presentation">
    <button class="nav-link" id="pills-disabled-tab" data-bs-toggle="pill" data-bs-target="#pills-disabled" type="button" role="tab" aria-controls="pills-disabled" aria-selected="false">Mayer</button>
  </li>
</ul>


<div class="tab-content" id="pills-tabContent">

<!-- User Tab -->
  <div class="tab-pane fade show active clearfix" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
  
  <form action="RouteServlet" method="post" class="col-md-5 mx-auto">
  <input type="hidden" name="action" value="addUser">
  <div class="mb-3">
    <label for="name" class="form-label">Name</label>
    <input name="name" type="text" class="form-control" id="name" aria-describedby="nameHelp">
  </div>
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
  <label for="userType" class="form-label">User Type</label>
  <select name="userType" class="form-select form-select-sm" aria-label=".form-select-sm example" id="userType">
  <option value="admin" selected>admin</option>
  <option value="client">client</option>
</select>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input name="paswd" type="password" class="form-control" id="exampleInputPassword1">
  </div>
  <button type="submit" class="btn btn-outline-secondary float-end w-25">Save</button>
</form>
  </div>
  
  <!-- Region Tab -->
  <div class="tab-pane fade clearfix" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
  
  <form action="RouteServlet" method="post" class="col-md-5 mx-auto">
  <input type="hidden" name="action" value="addRegion">
  <div class="mb-3">
    <label for="regionName" class="form-label">Name</label>
    <input name="name" type="text" class="form-control" id="regionName" aria-describedby="emailHelp">
  </div>
  <div class="mb-3">
  <label for="selectMayer" class="form-label">Mayer</label>
 <input name="mayer" type="text" class="form-control" id="selectMayer" aria-describedby="emailHelp">
  </div>
  <!-- <div class="mb-3">
  <label for="regionImage" class="form-label">Image</label>
  <input class="form-control form-control-sm" id="regionImage" type="file" name="regionImage">
</div>-->
  <div class="mb-3">
  <label for="aboutRegion" class="form-label">About</label>
  <textarea name="about" class="form-control" id="aboutRegion" rows="3"></textarea>
</div>
  <button type="submit" class="btn btn-outline-secondary float-end">Submit</button>
</form>
  </div>
  
  <!-- Council Tab -->
  <div class="tab-pane fade clearfix" id="pills-contact" role="tabpanel" aria-labelledby="pills-contact-tab" tabindex="0">
  
  <form action="RouteServlet" method="post" class="col-md-5 mx-auto">
  <input type="hidden" name="action" value="addCouncil">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required>
  </div>
    <div class="mb-3">
  <label for="selectRegion" class="form-label">Region</label>
  <select name="regionCouncil" class="form-select" aria-label="Default select example" id="selectRegion">
  <%
  RegionDAO regions = new RegionDAO();
		  for(Region region: regions.getRegions()){
  %>
  <option value="<%=region.getId()%>"><%=region.getName()%></option>
<%
		  }
%>
  </select>
  </div>
    <div class="mb-3">
  <label for="aboutCouncil" class="form-label">About</label>
  <textarea name="aboutCouncil" class="form-control" id="aboutCouncil" rows="3" required></textarea>
</div>
  <button type="submit" class="btn btn-outline-secondary float-end">Submit</button>
</form>
  </div>
  
  <!-- Mayer Tab -->
  <div class="tab-pane fade clearfix" id="pills-disabled" role="tabpanel" aria-labelledby="pills-disabled-tab" tabindex="0">
  
  <form class="col-md-5 mx-auto">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Name</label>
    <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
  </div>
   <div class="mb-3">
  <label for="selectRegion" class="form-label">Region</label>
  <select class="form-select" aria-label="Default select example" id="selectRegion">
  <option selected>Open this select menu</option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
  </select>
  </div>
  <!--   <div class="mb-3">
  <label for="mayerImage" class="form-label">Image</label>
  <input class="form-control form-control-sm" id="mayerImage" type="file">
</div>-->
  <button type="submit" class="btn btn-outline-secondary float-end">Submit</button>
</form>
  </div>
  
</div>
</section>

</main>

<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>