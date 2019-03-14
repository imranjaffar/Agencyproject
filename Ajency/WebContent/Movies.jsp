<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script>
	function showmovies(str) {

		if (typeof str == "undefined") {
			str = 1;
		}

		var lang = document.getElementById("language").value;
		var genre = document.getElementById("genre").value;
		var sort = document.getElementById("sort").value;
		var url = "search.jsp?page=" + str + "&sort=" + sort + "&lang=" + lang
				+ "&genre=" + genre;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function getInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;

			document.getElementById("Show_Data").innerHTML = val;
		}
	}

	function show_detail() {

		document.getElementById("content").style.display = "block";

		document.getElementById("detail").style.display = "none";

	}
</script>
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

.title {
	font-family: fantasy;
	font-size: 40px;
	font-variant: petite-caps;
}

p {
	font-family: cursive;
	font-size: 21px;
}

.Dir {
	font-size: 23px;
	color: gray;
	font-variant: petite-caps;
	font-weight: bolder;
}

.select {
	padding: 5px;
	background: antiquewhite;
}

#page {
	cursor: pointer;
}

.sub {
	margin-left: 416px;
}

.hr1 {
	background-color: #2a2727;
	border-width: medium;
	margin-left: 419px;
	margin-right: 83px;
}

.hr2 {
	background-color: black;
	margin-inline-end: 1400px;
}

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

.durat_lang {
	font-size: 20px;
	font-style: italic;
	font-variant: petite-caps;
}

.genre {
	font-size: 22px;
	background-color: black;
	color: white;
	border-radius: 7px;
}

.container img {
	vertical-align: middle;
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

p {
	color: black;
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

#container {
	min-height: 100%;
	position: relative;
}

body {
	margin-bottom: 50px;
}

body {
	padding: 10px;
	padding-bottom: 60px;
}

/*add*/
.header {
	height: 24px;
	width: 100%;
	background-image: none;
	background-repeat: repeat;
	background-attachment: scroll;
	background-position: 0% 0%;
	position: fixed;
	top: 0pt;
	left: 0pt;
	background-color: black;
	padding: 13px;
}

.header_contents {
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


<body onload="showmovies()">

	<div id="container">

		<div id="header">

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
				</ul>

				</nav>
				</center>

			</div>
		</div>
		<br></br>

		<div class="main">
			<h1 style="margin-left: 406px; color: #cc6c25;">EXPLORE</h1>

			<hr class="hr1">
			<div class="sub">
				<h3>FILTER BY:</h3>
				<hr class="hr2"></hr>

				<span class="select">GENERE:<select name="genre" id="genre"
					onchange="showmovies()">
						<option value="">All</option>
						<option value="1">Indian</option>
						<option value="2">Horror</option>
						<option value="3">Sci-Fi</option>
						<option value="4">Thriller</option>
						<option value="5">Award Winning</option>
				</select>
				</span> <br></br> <br></br> <span class="select">LANGUAGE:<select
					name="language" id="language" onchange="showmovies()">

						<option value="">All</option>
						<option value="Hindi">Hindi</option>
						<option value="English">English</option>
						<option value="French">French</option>
						<option value="Romanian">Romanian</option>
						<option value="Japanese">Japanese</option>
				</select>
				</span> <span class="select" style="margin-left: 400px;">SORT By: <select
					name="sort" id="sort" onchange="showmovies()">
						<option value="Freshness">Freshness</option>
						<option value="Popularity">Popularity</option>
						<option value="Length">Length</option>
				</select>

				</span>
			</div>

			<hr class="hr1">


			<div id="Show_Data" class="Show_Data">
				<div id="page">1</div>
			</div>

			<br></br> <br></br>
			<div class="footer">

				<div class="footer_contents">
					<center style="color: white;">
						ShortFilmWindow | All Rights Reserved. <br>
					</center>
				</div>

			</div>

		</div>

	</div>
</body>
</html>