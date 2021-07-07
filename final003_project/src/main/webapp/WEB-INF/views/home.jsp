<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<c:forEach items="${boardList}" var="board">
		<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		<br>
	</c:forEach>
</body>
</html>
