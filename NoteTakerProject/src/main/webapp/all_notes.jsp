<%@page import="java.util.List"%>

<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import=" org.hibernate.query.Query"%>
<%@page import="com.entities.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All notes: Note Taker</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
 <%@include file="navbar.jsp" %>
 <br>
 <h1 class="text-uppercase">All Notes: </h1>
 <div class="row">
 <div class="col-12">
 
 <%
 Session s=FactoryProvider.getFactory().openSession();
 /*  Query q= s.createQuery("from Note");*/
 Query q=s.createQuery("from Note");
 List<Note>list=q.list();
 for(Note note:list){
	 %> <div class="card mt-3">
  <img class="card-img-top m-4 mx-auto" style="max-width:100px;"src="img/notes.png" alt="Card image cap">
  <div class="card-body px-5">
    <h5 class="card-title"><%= note.getTitle() %></h5>
    <p class="card-text">
    <%= note.getContent() %>
    </p>
    <p><b class="text-primary"><%=note.getAddedDate() %></b></p><!-- this is for show date in shownotes.jsppage and <b>  is used for bold the date as compare to other words and text primary used to change colour -->
    <div class="container text-center mt-22">
    <a href="DeleteServlet2?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
    <a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
    </div>
  </div>
</div>
	 <% 
	 }
	// out.println(note.getId()+" : "+note.getTitle()+"<br>"); }
 s.close();
 %>
 </div></div>
 </div>
</body>
</html>