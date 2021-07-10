<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<div class="form-group">
	<label>${postInfoList[0].postInfoId}</label><input id="title" name="title" class="form-control" readonly>
</div>
<div class="form-group">	
	<label>내용</label>
	<textarea id="txaContent" name="content" class="form-control" rows="3" readonly>${postInfoList[0].postInfoContent}</textarea>
</div>
