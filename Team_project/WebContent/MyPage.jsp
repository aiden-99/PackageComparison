<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/my_pack.css" />
</head>
<body>
<div id = "container">
<ul class="h">
<li style="width:450px"><%=request.getParameter("nick") %>님이 찜한 패키지 목록입니다.</li> 
<li style="width:100px"><a href="correct.jsp?nick=<%=request.getParameter("nick")%>">메인으로</a></li>
<li style="width:100px"><a href="login.jsp">로그아웃</a></li>
<li style="width:50px"><a href="search.jsp?nick=<%=request.getParameter("nick")%>"><img src="image\search.png" alt="검색" class="img_button"></img></a></li>
</ul>
<%
		int button=0;
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs = null;
		String nick = request.getParameter("nick");
		int count=0;
		String pack1="",pack2="",pack3="";
		
					try{
						Class.forName("com.mysql.jdbc.Driver");
						String url="jdbc:mysql://localhost:3306/travel?serverTimezone=UTC";
						conn=DriverManager.getConnection(url,"root","0000");
						stmt=conn.createStatement();
						String sql = "select * from member where nick = '"+nick+"'"; 
						rs = stmt.executeQuery(sql);
					}
					catch(Exception e){
						out.println("DB 연동 오류입니다.:" + e.getMessage());
					}
					while(rs.next())
					{
						count = rs.getInt(5);
						pack1 = rs.getString(6);
						pack2 = rs.getString(7);
						pack3 = rs.getString(8);
					}
					%><table border="1px">
					<colgroup>
          			 <col style="width: 100px"><!--첫번째열-->
          			 <col style="width: 300px"><!--두번째열-->
         			 <col style="width: 20px"><!--세번째열-->
       				 </colgroup>
       				 <tr><td><center>번호</center></td><td>찜한 패키지</td><td></td></tr>
       				 <%
					if(count == 0)
					{
						%><tr><td><center>0</center></td><td><%=nick %>님이 찜한 패키지가 없습니다</td><td></td></tr> <%
					}
					else if(count == 1)
					{
						%><tr><td><center>1</center></td><td><a href="<%=pack1 %>" target="_blank">패키지1</a></td><td><button onclick="location.href='Update_pack.jsp?nick=<%=nick%>&num=1&count=<%=count%>'"><img src="image/minus.png"></button></td></tr> <% 
					}
					else if(count == 2)
					{
						%><tr><td><center>1</center></td><td><a href="<%=pack1 %>" target="_blank">패키지1</a></td><td><button onclick="location.href='Update_pack.jsp?nick=<%=nick%>&num=1&count=<%=count%>&pack2=<%=pack2%>'"><img src="image/minus.png"></button></td></tr> <%
						%><tr><td><center>2</center></td><td><a href="<%=pack2 %>" target="_blank">패키지2</a></td><td><button onclick="location.href='Update_pack.jsp?nick=<%=nick%>&num=2&count=<%=count%>&pack2=<%=pack2%>'"><img src="image/minus.png"></button></td></tr> <% 
					}
					else if(count == 3)
					{
						%><tr><td><center>1</center></td><td><a href="<%=pack1 %>" target="_blank">패키지1</a></td><td><button onclick="location.href='Update_pack.jsp?nick=<%=nick%>&num=1&count=<%=count%>&pack3=<%=pack3%>'"><img src="image/minus.png"></button></td></tr> <%
						%><tr><td><center>2</center></td><td><a href="<%=pack2 %>" target="_blank">패키지2</a></td><td><button onclick="location.href='Update_pack.jsp?nick=<%=nick%>&num=2&count=<%=count%>&pack3=<%=pack3%>'"><img src="image/minus.png"></button></td></tr> <% 
						%><tr><td><center>3</center></td><td><a href="<%=pack3 %>" target="_blank">패키지3</a></td><td><button onclick="location.href='Update_pack.jsp?nick=<%=nick%>&num=3&count=<%=count%>&pack3=<%=pack3%>'"><img src="image/minus.png"></button></td></tr> <% 
					}   
%></table>
</div>
</body>
</html>