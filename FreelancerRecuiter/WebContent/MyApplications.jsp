<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.io.PrintStream"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Applications</title>
<link rel="icon" href="images/logo.ico" type="image/x-icon" />
<script src="http://code.jquery.com/jquery-git2.js"></script>
   <meta name="viewport" content="width=device-width, initial-scale=1" />
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
   <style>
   	.iconcolor{
		color:#007bff;
	}
   </style>
</head>
<body>
<%
try{
	String free_id=(String) request.getSession().getAttribute("userid");
	
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/ishifree"; //MySQL URL and followed by the database name
	String username = "ishifree"; //MySQL username
	String password = "Freelancer@9876"; //MySQL password
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
	//System.out.println("Printing connection object "+con);
	
	String query = "Select * from proposals where free_id=?";
	PreparedStatement stmt = con.prepareStatement(query);
	stmt.setString(1,free_id);
	ResultSet details = stmt.executeQuery();
%>
	<div class="p-5 bg-primary text-white text-center" style="margin-top: 60px">
        <h1>Find all your Applications here!</h1>
        <p>Hope you got selected!</p>
    </div>

    <nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#" style="margin-left:6rem;">
            <img
                src="images/logo1.png"
                alt="Avatar Logo"
                style="width: 30%"
            />
            </a>
            <button
            class="navbar-toggler"
            type="button"
            data-bs-toggle="collapse"
            data-bs-target="#collapsibleNavbar"
            >
            <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <li class="nav-item">
                    <a class="nav-link" href="CandidateDashboard.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="SearchAJob.jsp">Jobs</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link active" href="MyApplications.jsp">My Applications</a>
                    </li>
                    <li class="nav-item">
                    <form action="LogoutServlet" method="post">
		                <input class="nav-link" style="color:white;background-color:black;" type="submit" value="Logout" class="iconcolor">
		            </form>
                    </li>
                </ul>
            </div>
            <form class="d-flex" style="margin-right:6rem;">
                <input class="form-control me-2" type="text" placeholder="Search" />
                <button class="btn btn-primary" type="button">
                    <i class="fa fa-search"></i>
                </button>
            </form>
        </div>
    </nav>
    
    <table class="table table-striped table-hover mt-3">
    <thead>
    	<tr class="fs-4 text fw-bold">
			<td>Proposal Id</td>
			<td>Job Id</td>
			<td>Company</td>
			<td>Status</td>
			<td>Duration</td>
			<td>Budget</td>
			<td>Cover Letter</td>
			<td>Posted on</td>
		</tr>
	</thead>
	<tbody>
    	<%while(details.next()){%>
		<tr>
			<td><%=details.getString("proposal_id") %></td>
			<td><%=details.getString("job_id") %></td>
			<% 
            String empId = details.getString("emp_id");
            String empQuery = "Select company from empdetails where Id = ?;";
            PreparedStatement q = con.prepareStatement(empQuery);
            q.setString(1, empId);
            ResultSet rs = q.executeQuery();
            rs.next();
            %>
			<td><%=rs.getString("company") %></td>
			<td><%=details.getString("status") %></td>
			<td><%=details.getString("duration") %></td>
			<td><%=details.getString("budget") %></td>
			<td><%=details.getString("coverletter") %></td>
			<td><%=details.getString("post_date") %></td>
		</tr>
		<%} %>
		</tbody>
	</table>
    
    	
    	
<%
}catch (Exception e) {
	e.printStackTrace();
}%>
</body>
</html>