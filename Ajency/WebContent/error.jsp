
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
html, body {
	margin: 0;
	padding: 0;
	height: 100%;
}

.image {
	max-width: 100%;
	max-height: 100%;
	vertical-align: middle;
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
	border-right: 1px solid #bbb;
}

li:last-child {
	border-right: none;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	padding-left: 45px;
}

.active {
	background-color: #4CAF50;
}

.container {
	position: relative;
	max-width: 800px;
	margin: 0 auto;
}

.container .content {
	position: absolute;
	color: black;
	bottom: 0;
	background: rgb(0, 0, 0);
	background: rgba(0, 0, 0, 0);
	color: #f1f1f1;
	width: 100%;
	padding: 20px;
}

#container {
	min-height: 100%;
	position: relative;
}

body {
	margin-bottom: 50px;
	padding: 10px;
	padding-bottom: 60px;
}

.footer {
	height: 24px;
	width: 100%;
	background-image: none;
	background-repeat: repeat;
	background-attachment: scroll;
	background-position: 0% 0%;
	position: fixed;
	bottom: 0pt;
	left: 0pt;
	background-color: red;
	padding: 13px;
}

.footer_contents {
	height: 24px;
	width: 1000px;
	margin: auto;
}

.mov_tittle {
	font-size: 42px;
	color: #d7ddfa;
}
</style>
</head>


<body>

	<div id="container">

		<div id="header" class="header">

			<div id="header_content">




				<nav>


				<ul>
					<span><span class="mov_tittle">S</span><img
						src="images/logo.png" style="height: 50px;" /><span
						class="mov_tittle">ORTFILMS</span></span>
					<center>
						<li style="margin-left: 393px;"><a href="Movies.jsp">Home</a></li>
						<li><a href="Movies.jsp">Movies</a></li>
						<li><a href="error.jsp">Articles</a></li>
						<li><a href='error.jsp'>Playlists</a></li>
						<li><a href='form.jsp'>Submit form</a></li>
						<li><a href='Contact.jsp'>Contact Us</a></li>
					</center>
				</ul>

				</nav>

			</div>
		</div>
		<br></br>

		<h1>This Page is Under Development</h1>
		<a href="Movies.jsp"><h1>Go Back</h1></a> <br></br> <br></br>

		<div class="footer">

			<div class="footer_contents">
				<center style="color: white;">
					ShortFilmWindow | All Rights Reserved. <br>
				</center>
			</div>

		</div>
</body>
</html>