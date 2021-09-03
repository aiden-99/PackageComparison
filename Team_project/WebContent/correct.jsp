<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%
    request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<title>Insert title here</title>
</head>
<body>
<div id="container">
<ul class="h">
<!-- attribute로 아이디 받아옴 -->
<li><%=request.getParameter("nick") %>님 반갑습니다.</li> 
<li style="width:100px"><a href="login.jsp">로그아웃</a></li>
<li style="width:50px"><a href="search.jsp?nick=<%=request.getParameter("nick")%>"><img src="image\search.png" alt="검색" class="img_button"></img></a></li>
<li style="width:50px"><a href="MyPage.jsp?nick=<%=request.getParameter("nick")%>"><img src="image\menu.jpg" alt = "메뉴" class="img_button"></img></a></li>
</ul>
<div id = "map"><img alt ="세계지도" src="image\world.jpg"></img>
<a href="eu_map.jsp?nick=<%=request.getParameter("nick")%>" id="eu">유럽</a>
<a href="asia_map.jsp?nick=<%=request.getParameter("nick")%>" id="asia">아시아</a>
<a href="SouthAmerica_map.jsp?nick=<%=request.getParameter("nick")%>" id="SouthAmerica">남아메리카</a>
</div>
</div>
</body>
</html>