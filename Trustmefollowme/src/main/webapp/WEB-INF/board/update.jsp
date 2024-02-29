<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<form action="replyUpdate" method="post">
<input type="hidden" name="ref" value="${reply.ref}">
<input type="hidden" name="re_level" value="${reply.re_level}">
<input type="hidden" name="re_step" value="${reply.re_step}">
<input type="hidden" name="b_num" value="${reply.b_num}">
<input type="text" name="content" value="${reply.content}">
<input type="submit" value="전송">
</form>