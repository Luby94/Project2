<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업회원가입 화면</title>

<style>

</style>

</head>
<body>

    <%@include file="/WEB-INF/views/include/header.jsp" %>

	<form action="/CWrite" method="POST">
		<table>
		 
		 <tr>
		   <td><button type="button" class="btn btn-info" name="개인회원">개인회원</button></td>
		   <td><button type="button" class="btn btn-Light" name="기업회원">기업회원</button></td>
	
		 </tr>
		 <tr>
		   <td>아이디</td>
		   <td><input type="text" name="com_id" /></td>
		 </tr>
		 <tr>
		   <td>비밀번호</td>
		   <td><input type="password" name="com_pw" /></td>
		 </tr>
		 <tr>
		   <td>비밀번호 확인</td>
		   <td><input type="password" name="com_pw" /></td>
		 </tr>
		 <tr>
		   <td>회사명</td>
		   <td><input type="text" name="com_name" /></td>
		 </tr>
		 <tr>
		   <td>사업장등록증</td>
		   <td><input type="text" name="com_num" /></td>
		 </tr>
		 <tr>
		   <td>대표자명</td>
		   <td><input type="text" name="com_boss" /></td>
		 </tr>
		 <!-- API 로 끌고오기 -->
		 <tr>
		   <td>회사주소</td>
		   <td><input type="text" name="com_adr" /></td>
		 </tr>
		 <tr>
		   <td>전화번호</td>
		   <td><input type="tel" name="com_tell" /></td>
		 </tr>
		 
		 <tr>
		   <td colspan="2">
		    <input type="submit" class="btn btn-info" value="가입하기" />
		    <button type="button" class="btn btn-info" id="cancel" >취소</button>
		   </td>
		 </tr>
		
		</table>	
	</form> 

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
	
	  const cancelEl = document.getElementById('cancel');
	  cancelEl.addEventListener( 'click', function() {
		  location.href = '/CLoginForm';
	  })
	
	</script>
	
</body>
</html>