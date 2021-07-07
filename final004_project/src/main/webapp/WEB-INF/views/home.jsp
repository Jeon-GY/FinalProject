<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" language="java"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<title>Home</title>
</head>
<body>
	<%@include file="./includes/header.jsp"%>
	
	<c:forEach items="${boardList}" var="board" >
		  <c:if test="${board.boardId eq '5' }">
		  	<a href="/post/managementProduct?boardId=${board.boardId}&sellerId=seller2">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '1'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '2'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '3'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '4'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
		  <c:if test="${board.boardId eq '6'}">
		  	<a href="/post/postList?boardId=${board.boardId}">${board.boardName}</a>
		  </c:if>
	</c:forEach>
	
</body>
</html>
<script>
	
</script>