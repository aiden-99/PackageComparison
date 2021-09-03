<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="css/basic.css" />
<title>Insert title here</title>
</head>
<body>
<div id = "container">
<ul class="h">
<li style="width:450px"><%=request.getParameter("nick") %>님 반갑습니다.</li> 
<li style="width:100px"><a href="correct.jsp?nick=<%=request.getParameter("nick")%>">메인으로</a></li>
<li style="width:100px"><a href="login.jsp">로그아웃</a></li>
<li style="width:50px"><a href="search.jsp?nick=<%=request.getParameter("nick")%>"><img src="image\search.png" alt="검색" class="img_button"></img></a></li>
<li style="width:50px"><a href="MyPage.jsp?nick=<%=request.getParameter("nick")%>"><img src="image\menu.jpg" alt = "메뉴" class="img_button"></img></a></li>
</ul>
<div id="map"><img alt="유럽지도" src="image/eu.png">
<a href="nation.jsp?name=UK&nick=<%=request.getParameter("nick")%>" id="UK">영국</a>
<a href="nation.jsp?name=france&nick=<%=request.getParameter("nick")%>" id="france">프랑스</a>
<a href="nation.jsp?name=germany&nick=<%=request.getParameter("nick")%>" id="germany">독일</a>
</div>
</div>
</body>
</html>