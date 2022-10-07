<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="tTour.model.Region" %>
<%@ page import="tTour.model.Council" %>
<%@ page import="tTour.dao.RegionDAO" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/main.css"/>
<link rel="icon" href="images/tFlag.png">
</head>
<body>

<nav class="container navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand fw-bold text-black" href="index.jsp">
    <img src="images/tFlag.png" class="brand-img"/>
    Light Tour
    </a>
    <button class="navbar-toggler bg-secondary" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
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
      
      <div>
            <!-- Button trigger Admin modal -->
<%
if(session.getAttribute("user") == null){
%>
<button type="button" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#adminModal">Admin</button>

<%
}else{
%>
<a class="btn btn-outline-secondary" href="admin.jsp">${user.getUserType()}</a>
<%} %>
      </div>

    </div>
  </div>
</nav>

<main class="container">
<div class="row mt-4">
<aside class="col-md-4 border-left">
<div class="list-group mb-3">
<label class="fs-3 mb-4">Regions</label>
    <%
  RegionDAO regions = new RegionDAO();
		  for(Region region: regions.getRegions()){
  %>
  <a href="RouteServlet?regionId=<%=region.getId()%>" class="list-group-item list-group-item-action"><%= region.getName()%></a>
  <%
		  }
  %>
</div>
</aside>
<div class="col-md-8 border-start">
<h2> ${region.getName()}</h2>
<p>
<img src="images/${region.getImage()}" class="float-start mx-2 img-fluid w-50"/>
${region.getAbout()}
</p>
<h3>Region Councils</h3>
<c:forEach items="${region.getCouncils()}" var="council">
<div class="my-2 bg-secondary rounded p-2">
<h5>${council.getName()}</h5>
<p>${council.getAbout()}</p>
</div>
</c:forEach>
</div>
</div>
</main>

<!-- Admin Modal -->
<div class="modal fade" id="adminModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Sign in</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      
     <form action="RouteServlet" method="post">
     <input type="hidden" name="action" value="login">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="email">
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" name="password">
  </div>
  <button type="submit" class="btn btn-primary float-end">Sign in</button>
</form>

      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>