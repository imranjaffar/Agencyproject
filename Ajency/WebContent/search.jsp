
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.bean.Movies"%>
<%@ page import="com.dao.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<HTML>
<head>

</head>
<body>
	<%
		int genre = 0;
		String lang = "";
		String sort = "";
		int pageid = 0;

		String spageid = request.getParameter("page");

		if (spageid.equals("")) {
			pageid = 1;
		} else {
			pageid = Integer.parseInt(spageid);
		}

		int total = 5;
		if (pageid == 1) {
		} else {
			pageid = pageid - 1;
			pageid = pageid * total + 1;
		}

		if (!request.getParameter("genre").equalsIgnoreCase("")) {
			genre = Integer.parseInt(request.getParameter("genre"));
		}
		if (!request.getParameter("lang").equalsIgnoreCase("")) {
			lang = request.getParameter("lang");
		}
		if (!request.getParameter("sort").equalsIgnoreCase("")) {
			sort = request.getParameter("sort");
		}

		if (sort.equalsIgnoreCase("Freshness")) {
			sort = "published_on";
		} else if (sort.equalsIgnoreCase("Popularity")) {
			sort = "views";
		} else if (sort.equalsIgnoreCase("Length")) {
			sort = "duration";
		}

		MoviesDao m = new MoviesDao();

		List<Movies> list = m.fetchData(genre, lang, sort, pageid, total);

		int count = m.getCount(lang, genre);

		System.out.println("-------------------count-----" + count);
	%>


	<%
		if (count <= 0) {
	%>

	<div class="container">
		<center
			style="margin-left: 100px; text-size-adjust: -17px; font-size: larger; color: brown; font-family: fantasy;">No
			data found</center>
	</div>
	<%
		} else {
	%>

	<div class="container">

		<%
			for (Movies mlist : list)

				{
		%><div class="colmn">
			<br></br>
			<div class="image">
				<img src="<%=mlist.getImage()%>" height="700px" width="1140px"
					align="center"></img>
			</div>
			<span class="title"><%=mlist.getTitle()%></span> <span class="Dir">by
				<%=mlist.getDirector()%>
			</span> <br></br>
			<hr style="margin-right: -338px;">
			<p>
				<%=mlist.getDesc()%>
			</p>
			<div class="view_likes" style="height: 38px;">
				<span class="views"><img src="images/view-Icon.png"
					style="height: 30px;"><%=mlist.getViews()%></span> <span
					class="likes"><img src="images/likes_icon.jpg"
					style="height: 38px;"><%=mlist.getLikes()%></span>
			</div>
			<br> <span class="durat_lang"><%=mlist.getLanguage()%> /
				<%=mlist.getDuration()%> MIN</span> <br>
			<%
				List<String> genreList = m.getGenreName(mlist.getId());
						for (String str : genreList) {
			%>
			<span class="genre"><%=str%></span>&nbsp&nbsp
			<%
				}
			%>
			<br></br>


		</div>
		<%
			}
		%>



	</div>
	<%
		}
	%>

</body>

<div class="page" style="margin-left: 862px;">
	<h3>PAGES:</h3>
	<%
		int pageCount = 0;
		for (int i = 0; i < count; i = i + 5) {
			pageCount = pageCount + 1;
	%>
	<span class="pageno" id="page" onclick="showmovies(<%=pageCount%>)"
		style="color: wheat; font-size: 26px; background-color: black;"><%=pageCount%></span>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp

	<%
		}
	%>



</div>
</html>


