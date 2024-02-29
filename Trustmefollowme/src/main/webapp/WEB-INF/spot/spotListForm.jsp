<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script>
$(function() {
	  $("#btn_open_modal").click(function() {
	        $("#modal").modal("show");
	    });
});
</script>
<center>
<h1>spotListForm.jsp</h1>
</center>
<hr>
<table align="center" border="1">
	<tr>
		<td align="right" colspan="3">
			<button id="btn_open_modal" onclick="spotInsert.sp">추가</button>
		</td>
	</tr>
	<tr align="center">
	<c:set var="count" value="0"/>
	<c:set var="path" value="<%=request.getContextPath() %>"/>
	<c:forEach var="sb" items="${list }">
		<c:set var="count" value="${count+1 }"/>
		<td>
			<a id="btn_open_modal" href="spotDetail.sp?snum=${sb.snum }&pageNumber=${paging.pageNumber }">
				<img src="${path }/resources/images/${sb.image }" width="80" height="80" align="top">
			</a><br>
			<h3>${sb.name }</h3><br>
			${sb.address }<br>
			<input type="button" onclick="location.href='spotUpdate.sp?snum=${sb.snum }'" value="수정">
			<input type="button" onclick="location.href='spotDelete.sp?snum=${sb.snum }'" value="삭제">
			
		</td>

	</c:forEach>
	</tr>
</table>

<center>
	${paging.pagingHtml }
</center>
<div class="modal" id="modal"  role="dialog" aria-labelledby="remoteModalLabel" aria-hidden="true" >
	<div class="modal-dialog" style="width:850px;">
		<div class="modal-content" >
			<%@ include file="spotInsertForm.jsp" %>			
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary" id="btn_save">저장</button>
			</div>
		</div>
	</div>
</div>