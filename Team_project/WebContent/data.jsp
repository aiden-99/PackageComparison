<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body bgcolor="antiquewhite">
<% 
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   String name,id,pwd,nick;
   String sql;
   name = request.getParameter("name");
   id = request.getParameter("id");
   pwd = request.getParameter("pwd");
   nick = request.getParameter("nick");
   if(nick==null)
   		%><script>alert("이름과 닉네임을 작성해야 합니다"); history.back();</script><%
   try{
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/travel?serverTimezone=UTC";
      conn = DriverManager.getConnection(url, "root", "0000");
      stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
      sql = "insert into member values('"+nick+"','"+id+"','"+pwd+"','"+name+"',0,NULL,NULL,NULL)";
      stmt.executeUpdate(sql);
   }
   catch(Exception e){ 
      out.println("DB 연동 오류입니다.:" + e.getMessage());
   }
%>
<script>alert("회원가입이 완료되었습니다"); document.location.href="correct.jsp?nick=<%=nick%>";</script>
</center>
</body>
</html>