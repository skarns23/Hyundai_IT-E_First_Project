<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    	<!-- 남승현 작성  
			기능 : 로그인 실패시 띄우는 화면, 다시 로그인화면으로 되돌아감
	 -->
<script type="text/javascript">
  alert("로그인 실패");
  history.go(-1);
</script>