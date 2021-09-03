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
	int num = Integer.parseInt(request.getParameter("num"));
	String nick = request.getParameter("nick");
	String pack2="", pack3="";
	int count = Integer.parseInt(request.getParameter("count"));
	String sql;
	Connection conn=null;
	Statement stmt=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost:3306/travel?serverTimezone=UTC";
		conn=DriverManager.getConnection(url,"root","0000");
		stmt=conn.createStatement(); 
	if(count == 3){
		count = count -1;
		pack3=request.getParameter("pack3");
		if(num==1){
			sql="update member set count="+count+", pack1='"+pack3+"', pack3=NULL"+" where nick= '"+nick+"'";
		}
		else if(num==2){
			sql="update member set count="+count+", pack2='"+pack3+"', pack3=NULL"+" where nick= '"+nick+"'";
		}
		else{//num==3
			sql="update member set count="+count+", pack3=NULL"+" where nick= '"+nick+"'";
		}
	}
	else if(count == 2){
		count = count -1;
		pack2=request.getParameter("pack2");
		if(num==1){
			sql="update member set count="+count+", pack1='"+pack2+"', pack2=NULL"+" where nick= '"+nick+"'";
		}
		else{//num==2
			sql="update member set count="+count+", pack2=NULL"+" where nick= '"+nick+"'";
		}
	}
	else{ //count == 1
		count = count -1;
		sql="update member set count="+count+", pack1=NULL"+" where nick= '"+nick+"'";
	}
	stmt.executeUpdate(sql);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.:" + e.getMessage());
	}
%>
<script>alert("삭제 완료되었습니다"); document.location.href="MyPage.jsp?nick=<%=nick%>";</script>
</body>
</html>