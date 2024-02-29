<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
    var redirectUrl = "${redirectUrl}";
    if (redirectUrl) {
        alert('회원가입이 완료되었습니다.');
        location.href = redirectUrl;
    }
    
    var adminlogin = "${adminlogin}";
    if (adminlogin) {
        alert('관리자님 반갑습니다!');
        location.href = "admin.mb";
    }
</script>