<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>

#content:hover {
	opacity: 0;
}

#detail:hover {
	opacity: 1;
}

ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

.active {
	background-color: #4CAF50;
}

.container {
	position: relative;
	max-width: 800px;
	margin: 0 auto;
}

p {
	color: black;
}
</style>
</head>


<body>
	<%response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);%>



	<div class="header">
		<nav>
		<ul>

			<li><a href="Movies.jsp">Home</a></li>
			<li><a href="Movies.jsp">Movies</a></li>
			<li><a href="error.jsp">Articles</a></li>
			<li><a href='error.jsp'>Playlists</a></li>
			<li><a href='form.jsp'>Submit form</a></li>
			<li><a href='Contact.jsp'>Contact Us</a></li>
		</ul>

		</nav>
	</div>
	<br></br>

<h1>SUBMIT FILM</h1>
<div class="upperarea"></div>
<form>
Title of the Film <input type="text" >
</br>
Film URL <input type="text" >
</br>
Email Address <input type="text" >
</br>
Password(if Any) <input type="text" >
</br>
Synopsis & Festival Selections (if any) 
<textarea rows="20" cols="20"></textarea>
<button value="submit" name="submit"></button>
</form>
</body>
</html>