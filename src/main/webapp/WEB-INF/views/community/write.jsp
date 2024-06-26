<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
   input:not(input[type=submit]) { width:100%; }
   input[type=submit] { width : 100px; }
   #goList  { width : 80px; }
   
   td { 
      padding:10px;
      width: 700px;
      text-align: center;
   }
   td:nth-of-type(1) {
      width : 200px;
   }
   
   td:not([colspan]):first-child {
      background: black;
      color : white;
      font-weight: bold;
   }
   
   input[readonly] {
      background: #EEE;
   }

</style>
</head>
<body>
  <main>
    
    <%@include file="/WEB-INF/views/include/pheader.jsp" %>
  
	<h2>게시글 등록</h2>
	<form action="/Community/Write" method="POST">
	<input type="hidden" name="com_id" value="${ com_id }" />
	<table>
	 <tr>
	   <td>제목</td>
	   <td><input type="text" name="ccomu_title" /></td>
	 </tr>
	 <tr>
	   <td>작성자</td>
	   <td>${ com_id }</td>
	 </tr>
	 <tr>
	   <td>내용</td>
	   <td><textarea name="ccomu_content"></textarea></td>
	 </tr>	
	 <tr>
	   <td colspan="2">
	    <input type="submit" value="글 쓰기" />
	    <input type="button" value="목록" id="goList" />
	   </td>
	 </tr>
	
	</table>	
	</form>   
	
  </main>
  <%@include file="/WEB-INF/views/include/footer.jsp"%>
  <script>
  	const  goListEl  = document.getElementById('goList');
  	goListEl.addEventListener('click', function(e) {
  		location.href = '/Community/ComuHome';
  	})
  
  </script>
  
</body>
</html>





