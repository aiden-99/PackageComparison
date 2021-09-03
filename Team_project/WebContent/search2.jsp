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
   int flag=0;
   int nation_size=9;
   String nick=request.getParameter("nick");
   String name=request.getParameter("nation");
   String name1=name;
   String []nations_kor = {"중국", "일본", "필리핀", "브라질", "아르헨티나", "콜롬비아", "영국", "프랑스", "독일"};
   String []nations_eng = {"china", "japan", "philippines", "brazil", "argentina", "colombia", "UK", "france", "germany"};
   for(int i=0;i<nation_size;i++)
   {
	   if(nations_kor[i].equals(name))
	   {
		   name=nations_eng[i];
		   flag++;
	   }
   }
   if(flag==0)
   {
	   %><script>alert("지원하지 않는 나라입니다"); history.back();</script><%
   }
%>
<script>document.location.href="nation.jsp?name=<%=name%>&nick=<%=nick%>"</script>
</body>
</html>