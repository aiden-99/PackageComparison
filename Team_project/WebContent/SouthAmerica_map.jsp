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
<div id="map"><img alt="남미지도" src="image/SouthAmerica.png">
<a href="nation.jsp?name=argentina&nick=<%=request.getParameter("nick")%>" id="argentina">아르헨티나</a>
<a href="nation.jsp?name=colombia&nick=<%=request.getParameter("nick")%>" id="colombia">콜롬비아</a>
<a href="nation.jsp?name=brazil&nick=<%=request.getParameter("nick")%>" id="brazil">브라질</a>
</div>
</div>
</body>
</html>