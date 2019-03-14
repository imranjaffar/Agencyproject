package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Movies;

public class MoviesDao {

	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ajency", "root", "");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}

	public ArrayList<Movies> fetchData(int genre, String lang, String sort, int start, int total) {
		ArrayList<Movies> list = new ArrayList<Movies>();
		try {

			Connection con = getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;
			if (genre != 0) {
				if (sort.equals("published_on")) {
					ps = con.prepareStatement(
							"SELECT * FROM movies WHERE  id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE g.id =  "
									+ genre + " AND g.id = m.genre_id) order by " + sort + " asc  limit " + (start - 1)
									+ "," + total + "");

				} else {
					ps = con.prepareStatement(
							"SELECT * FROM movies WHERE  id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE g.id =  "
									+ genre + " AND g.id = m.genre_id) order by " + sort + " desc limit " + (start - 1)
									+ "," + total + "");

				}

			} else

			{

			}

			if (genre != 0 && !lang.equals("")) {

				if (sort.equals("published_on")) {
					ps = con.prepareStatement("SELECT * FROM movies WHERE language='" + lang
							+ "' and  id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE g.id =  " + genre
							+ " AND g.id = m.genre_id) order by " + sort + " asc  limit " + (start - 1) + "," + total
							+ "");

				} else {
					ps = con.prepareStatement("SELECT * FROM movies WHERE language='" + lang
							+ "' and id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE g.id =  " + genre
							+ " AND g.id = m.genre_id) order by " + sort + " desc limit " + (start - 1) + "," + total
							+ "");

				}

			} else if (!lang.equals("")) {
				if (sort.equals("published_on")) {
					ps = con.prepareStatement("SELECT * FROM movies WHERE language='" + lang
							+ "' and  id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE   g.id = m.genre_id) order by "
							+ sort + " asc  limit " + (start - 1) + "," + total + "");

				} else {
					ps = con.prepareStatement("SELECT * FROM movies WHERE language='" + lang
							+ "' and id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE  g.id = m.genre_id) order by "
							+ sort + " desc limit " + (start - 1) + "," + total + "");

				}
			} else if (genre != 0) {

				if (sort.equals("published_on")) {
					ps = con.prepareStatement(
							"SELECT * FROM movies WHERE   id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE g.id =  "
									+ genre + " AND g.id = m.genre_id) order by " + sort + " asc  limit " + (start - 1)
									+ "," + total + "");

				} else {
					ps = con.prepareStatement(
							"SELECT * FROM movies WHERE  id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE g.id =  "
									+ genre + " AND g.id = m.genre_id) order by " + sort + " desc limit " + (start - 1)
									+ "," + total + "");

				}

			} else {
				if (sort.equals("published_on")) {
					ps = con.prepareStatement(
							"SELECT * FROM movies  order by " + sort + " asc limit " + (start - 1) + "," + total + "");

				} else {
					ps = con.prepareStatement("SELECT * FROM movies   order by " + sort + " desc limit " + (start - 1)
							+ "," + total + "");

				}
			}

			rs = ps.executeQuery();

			while (rs.next()) {
				Movies m = new Movies();
				m.setId(rs.getInt(1));
				m.setTitle(rs.getString(2));
				m.setImage(rs.getString(3));
				m.setDuration(rs.getInt(4));

				m.setDesc(rs.getString(5));
				m.setLanguage(rs.getString(6));

				m.setDirector(rs.getString(7));
				m.setViews(rs.getInt(8));

				m.setLikes(rs.getInt(9));

				list.add(m);

			}

		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public List<String> getGenreName(int movies_id) {
		List<String> list = new ArrayList<String>();
		try {

			Connection con = getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;

			ps = con.prepareStatement(
					"SELECT name FROM genre WHERE id IN (SELECT b.genre_id FROM movies a, movies_genre b WHERE b.movies_id = a.id AND a.id =  "
							+ movies_id + ")");

			rs = ps.executeQuery();

			while (rs.next()) {
				list.add(rs.getString(1));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;

	}

	public int getCount(String lang, int genre) {
		int count = 0;
		try {

			Connection con = getConnection();
			PreparedStatement ps = null;
			ResultSet rs = null;

			if (genre != 0 && !lang.equals("")) {
				ps = con.prepareStatement("SELECT count(*) FROM movies WHERE  language='" + lang
						+ "' and id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE g.id = " + genre
						+ " AND g.id = m.genre_id)");
				System.out.println("sql query--------" + ps);
			} else if (!lang.equals("")) {
				ps = con.prepareStatement("SELECT count(*) FROM movies WHERE  language='" + lang
						+ "' and id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE  g.id = m.genre_id)");
				System.out.println("sql query--------" + ps);
			} else if (genre != 0) {
				ps = con.prepareStatement(
						"SELECT count(*) FROM movies WHERE   id	IN (SELECT m.movies_id FROM genre g, movies_genre m WHERE g.id = " + genre+"  AND  g.id = m.genre_id)");
			} else {
				ps = con.prepareStatement("SELECT count(*) FROM movies ");
			}

			rs = ps.executeQuery();

			while (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;

	}

}
