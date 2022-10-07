<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
response.addHeader("Cache-Control","no-cache"); //HTTP 1.1
response.addHeader("Pragma","no-cache"); //HTTP 1.0
response.addDateHeader ("Expires", 0); //prevent caching at the proxy server
%>
<%@ page import="tTour.model.Region" %>
<%@ page import="tTour.dao.RegionDAO" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="css/bootstrap.min.css"/>
<link rel="stylesheet" href="css/main.css"/>
<link rel="icon" href="images/tFlag.png">
</head>
<body class="bg-secondary">


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
            <!-- Button trigger informodal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#inforModal">
  About App
</button>
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

<main class="container" id="main-container">
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

<p class="">
<img src="images/tImage_2.jpg" class="float-start mx-2 img-fluid"/>
Tanzania officially the United Republic of Tanzaniais a country in East Africa within the African Great Lakes region.
It borders Uganda to the north; Kenya to the northeast; Comoro Islands and the Indian Ocean to the east; 
Mozambique and Malawi to the south; Zambia to the southwest; and Rwanda, Burundi, and the Democratic Republic of the Congo to the west.
 Mount Kilimanjaro, Africa's highest mountain, is in northeastern Tanzania.
 </p>
<p>
German rule began in mainland Tanzania during the late 19th century when Germany formed German East Africa.
This was followed by British rule after World War I. The mainland was governed as Tanganyika,
with the Zanzibar Archipelago remaining a separate colonial jurisdiction.
Following their respective independence in 1961 and 1963,
the two entities merged in 1964 to form the United Republic of Tanzania.
 The countries had joined the British Commonwealth in 1961 and Tanzania is still a member of the Commonwealth as one republic.
 </p>
 <p>
 British rule came to an end on 9 December 1961. 
 Elizabeth II, who had acceded to the British throne in 1952,
 continued to reign through the first year of Tanganyika's independence, 
 but now distinctly as Queen of Tanganyika, represented by the governor general:Tanganyika also joined the British Commonwealth in 1961. On 9 December 1962,
 Tanganyika became a democratic republic under an executive president.
</p>
<p>
After the Zanzibar Revolution overthrew the Arab dynasty in neighbouring Zanzibar, 
accompanied with the slaughter of thousands of Arab Zanzibaris,which had become independent in 1963,
 the archipelago merged with mainland Tanganyika on 26 April 1964.The new country was then named the United Republic of Tanganyika and Zanzibar
 On 29 October of the same year, the country was renamed the United Republic of Tanzania ("Tan" comes from Tanganyika and "Zan" from Zanzibar).
 The union of the two hitherto separate regions was controversial among many Zanzibaris (even those sympathetic to the revolution) but was accepted by both the 
 Nyerere government and the Revolutionary Government of Zanzibar owing to shared political values and goals.
</p>

</div>
</div>

<!-- infor Modal -->
<div class="modal fade" id="inforModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">About Tz Tour</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center fs-4 fw-normal">
     The app shows basic information about Regions in Tanzania
      and other little information to get you familiar with some few places in <strong>Tanzania</strong>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary fw-bold mx-auto w-25" data-bs-dismiss="modal">OK</button>
      </div>
    </div>
  </div>
</div>

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

</main>
<footer class="container">
<div class="row bg-secondary text-center fs-3 fw-bold mt-3">
<div class="col-md">
&#64;
<span id="yr">
</span>
</div>
</div>
</footer>

<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
    $(window).on('load',function(){
       //$('#inforModal').modal('show');
       $('#yr').text(innerContent = new Date().getFullYear());
    });
</script>
</body>
</html>