<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="form-group">
	<label>제목</label> <input id="title" name="title" value="${post.postTitle}" class="form-control" readonly>
</div>
<div class="form-group">
	<label>내용</label>
</div>
<div class="form-group">
	<label>작성자</label> 
</div>
<div class="form-group">
	<label>판매수</label> <input value="${post.sellCount}" readonly>
	<label>별점</label> <input value="${post.rateScore}" readonly>
</div>

