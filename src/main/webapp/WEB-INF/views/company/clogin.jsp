<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업로그인 화면</title>

<style>

  .table-container {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 60vh;
  }
  
  .login-table, 
  .login-table tr,
  .login-table tr td {
    width: 28%;
    /* border: 1px solid black; */
  }
  
  .login-table input[type="text"],
  .login-table input[type="password"],
  .login-table a {
    width: 300px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    outline: none;
    margin: 10px 0;
  }

  .login-table a {
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    text-decoration: none;
  }

  .login-table a:hover {
    background-color: #0056b3;
  }
  
  .login-table td {
    text-align: center; /* 수평 정렬 */
    vertical-align: middle; /* 수직 정렬 */
  }
  
  .login-table tr td:first-child {
    width: 10%;
  }
  
  #firstrow {
    height: 80px;
  }
  
  .login-table button,
  #logincss {
    width: 100px;
    padding: 10px;
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #666;
    color: #fff;
    cursor: pointer;
    text-decoration: none;
  }
  
</style>

</head>
<body>

    <%@include file="/WEB-INF/views/include/header.jsp" %>

	<form action="/CLogin" method="POST">
	
	<div class="table-container">
		
		<table class="login-table">
			 
			<tr>
			  <td colspan="2" id="firstrow">
			    <a href="PLoginForm" class="btn btn-info">개인용</a>
			    <a href="CLoginForm" class="btn btn-info">기업용</a>
			  </td>
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
			   <td colspan="2">
			    <button type="button" class="btn btn-primary" id="writeForm" >회원가입</button>
			    <input type="submit" value="로그인" id="logincss" />
			   </td>
			 </tr>
		
		</table>
		
	</div>
		
	</form> 

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	
	<script>
	
	  const writeFormEl = document.getElementById('writeForm');
	  writeFormEl.addEventListener( 'click', function() {
		  location.href = '/CWriteForm';
	  })
	
	</script>
	
</body>
</html>