<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="antiquewhite">
<% 
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   String id="", pwd="";
   String sql;
   boolean flag = false;
   id = request.getParameter("id");
   pwd = request.getParameter("pwd");
   try{
      Class.forName("com.mysql.jdbc.Driver");
      String url = "jdbc:mysql://localhost:3306/travel?serverTimezone=UTC";
      conn = DriverManager.getConnection(url, "root", "0000");
      stmt = conn.createStatement();
      sql = "select * from member where id = '" + id+"'";
      rs = stmt.executeQuery(sql);
   } 
   catch(Exception e){ 
      out.println("DB 연동 오류입니다.:" + e.getMessage());
   }
   while(rs.next()){
      flag = true;
   if(!pwd.equals(rs.getString("pwd"))){
%>
<center><h2>회원정보가 올바르지 않습니다</h2>
<a href="login.jsp">로그인 페이지로</a></center>
<%
}
else
{   
%>
<script>alert("로그인 성공"); document.location.href="correct.jsp?nick=<%=rs.getString("nick")%>"</script>
<%
}
   break;
}
   if(!flag){%>
   <center><h2>회원정보가 올바르지 않습니다</h2>
   <a href="login.jsp">로그인 페이지로</a></center>
<%}%>
</body>
</html>