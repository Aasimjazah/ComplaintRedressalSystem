<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page isELIgnored="false" %>
<%@taglib prefix="c" uri= "http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>CSS Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="css/navi.css">
<link rel="stylesheet" href="css/scrollstyle.css">
<link rel="stylesheet" href="css/btnbadge.css">
<style>
* {
	box-sizing: border-box;
}

body {
	font-family: Arial, Helvetica, sans-serif;
	background-color: #252636;
}

/* Create two columns/boxes that floats next to each other */
nav {
	float: left;
	width: 20%;
	background: #313348;
	padding: 20px;
	margin-left: 25px;
	margin-top: 20px;
	color: white;
}

/* Style the list inside the menu */
nav ul {
	list-style-type: none;
	padding: 0;
}

article {
	float: left;
	padding: 20px;
	width: 75%;
	margin-left: 25px;
	margin-top: 20px;
	background-color: #313348;
	height: 600px; /* only for demonstration, should be removed */
	color: white;
	overflow: auto;
}

/* Clear floats after the columns */
section:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media ( max-width : 600px) {
	nav, article {
		width: 100%;
		height: auto;
	}
}

.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	width: 40px;
	height: 40px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 10px;
}

.button2 {
	background-color: #f44336;
} /* Red */
#sidbutton {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 15px 32px;
	width: 100%;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 5px;
}
</style>
</head>
<body>
	<div class="navbar">
		<a href="index.html"><i class="fa fa-fw fa-home"></i> Home</a> <a
			href="#"><i class="fa fa-fw fa-envelope"></i> Contact</a> <a
			class="active" href="profile.jsp"><i class="fa fa-fw fa-user"></i>Profile</a>
		<a href="logout" style="float: right;"><i
			class="fa fa-sign-out"></i>Logout</a>
	</div>

	<section> <nav>
	<center><h2>Manager</h2></center>
	<center>
		<i class="fa fa-user-circle-o"
			style="font-size: 100px; color: #FE9800"></i>
	</center>
	<center>
		<p>
			+91 ${manager.phone }</p>
		<p>
			<i class="fa fa-address-card"
				style="font-size: 20px; margin-right: 10px;"></i>
			${manager.name }</p>
		<p>
			<i class="fa fa-envelope"
				style="font-size: 20px; margin-right: 10px;"></i>${manager.email }</p>


	</center>

	<br>

	<a href="allcomplaints" id="sidbutton" class="badge1"
		data-badge=<%-- <%=resultSet1.getString("count(*)")%> --%>><i
		class="fa fa fa-clipboard"
		style="font-size: 20px; margin-right: 10px;"></i>All Complaints</a> </nav> 
		
  <article>

	<h2>All Complaints</h2>
	<br>
	<div class="w3-container">
		<table class="w3-table w3-bordered">
			<tr style="color: #FE9800;">
				<th>ID</th>
				<th>User ID</th>
				<th>Title</th>
				<th>Description</th>
				<th>Engineer ID</th>
				<th>User FeedBack</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
 
			  <c:forEach var="complaint" items="${complaints}">
			     <tr>
	                 <td>${complaint.id}</td>
	                 <td>${complaint.uid}</td>
	                 <td>${complaint.title}</td>
	                 <td>${complaint.description}</td>
	                 <td><select name="eid" id="eid" class="form-select" aria-label="Default select example">
	                        <option value="eid">${complaint.eid}</option>
	                        <c:forEach var="manager" items="${managers}">
					          <option value="eid">${manager.id}</option>
					        </c:forEach>
				          </select>
				     </td>
	                 <td>${complaint.userfeedback}</td>
	                 <td>${complaint.status}</td>
	                 <td><a href="#"><button class="button button2"><i class="fa fa-trash" style="font-size:20px;"></i></button></a></td>
                 </tr> 
              </c:forEach>

		</table>
	</div>
	</article> </section>

</body>
</html>
