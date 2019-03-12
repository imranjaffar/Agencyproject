<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script>

function showmovies(str) {

	if (typeof str == "undefined") {
	 str=1;
	}
	
	var lang  = document.getElementById("language").value;
	var genre  = document.getElementById("genre").value;
	var sort  = document.getElementById("sort").value;
	var url="search.jsp?page="+str+"&sort="+sort+"&lang="+lang+"&genre="+genre;  
	  
	if(window.XMLHttpRequest){  
	request=new XMLHttpRequest();  
	}  
	else if(window.ActiveXObject){  
	request=new ActiveXObject("Microsoft.XMLHTTP");  
	}  
	  
	try{  
	request.onreadystatechange=getInfo;  
	request.open("GET",url,true);  
	request.send();  
	}catch(e){alert("Unable to connect to server");}  
	}  
	  
	function getInfo(){  
	if(request.readyState==4){  
	var val=request.responseText;  

	
	document.getElementById("Show_Data").innerHTML=val;
	}  
}




function show_detail()
{


document.getElementById("content").style.display="block";


document.getElementById("detail").style.display = "none";

}
</script>
<style>
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
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li
 
a
:hover
:not
 
(
.active
 
)
{
background-color
:
 
#111
;


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
	background: rgb(0, 0, 0); /* Fallback color */
	background: rgba(0, 0, 0, 0); /* Black background with 0.5 opacity */
	color: #f1f1f1;
	width: 100%;
	padding: 20px;
}

p {
	color: black;
}
</style>
</head>


<body onload="showmovies()">
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


	<footer id="footer"> </footer>
</body>
</html>