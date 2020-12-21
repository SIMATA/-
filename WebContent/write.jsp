<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@  page import="java.io.PrintWriter"%>
<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.min.css">

<title>Shopping Mall</title>

</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
 <!-- 네비게이션  -->

 <nav class="navbar navbar-default">
  <div class="navbar-header">
   <button type="button" class="navbar-toggle collapsed" 
    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    aria-expaned="false">
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
     <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="main.jsp">쇼핑몰</a>
  </div>
  <div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
   <ul class="nav navbar-nav">
   
	<!--  현재 접속해 있는 페이지 active -->
    <li><a href="main.jsp">메인</a></li>
    <li class="active"><a href="bbs.jsp">주문하기</a></li>
	
	<!--  로그인이 안되어 있다면 회원가입 페이지로 -->
   </ul>
	<%
		if(userID == null) {
	%>
	<ul class="nav navbar-nav navbar-right">

	    <li class="dropdown">
	     <a href="#" class="dropdown-toggle"
	      data-toggle="dropdown" role="button" aria-haspopup="true"
	      aria-expanded="false">접속하기<span class="caret"></span></a>
	     <ul class="dropdown-menu">
	      <li><a href="login.jsp">로그인</a></li>
	      <li><a href="join.jsp">회원가입</a></li>
	     </ul>
	    </li>
	   </ul>
	<%
		} else {
	%>
		<ul class="nav navbar-nav navbar-right">

	    <li class="dropdown">
	     <a href="#" class="dropdown-toggle"
	      data-toggle="dropdown" role="button" aria-haspopup="true"
	      aria-expanded="false">회원관리<span class="caret"></span></a>
	     <ul class="dropdown-menu">
	      <li><a href="logoutAction.jsp">로그아웃</a></li>
	     </ul>
	    </li>
	   </ul>
	<%
		}
	%>
  </div>
 </nav>
 
 <div class = "containter">
 	<div class="row"> 
 	<form method="post" action="writeAction.jsp">
 		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin: 20px">
 			<thead>
 				<tr>
 					<th colspan="2" style="background-color: #eeeeee; text-align: center;">주문서 양식</th>
 					
 				</tr>
 			</thead>
 				<tbody>
 					<tr>
 						<td><input type="text" class="form-control" placeholder="주문 상품 이름을 입력해주세요" name="bbsTitle" maxlength="50"></td>
 					</tr>
 					<tr>
 						<td><textarea class="form-control" placeholder="12948902-01-38945279 으로 입금해주세요.&#13;&#10;입금이완료되면 순차적으로 배송됩니다.&#13;&#10;배송지역을 남겨주세요!" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
 					</tr>
 				</tbody>
 		</table>
 		<input type="submit" class="btn btn-primary pull-right" style="margin-right: 40px;" value="글쓰기">
 	</form>
 		
 		
 	</div>
 </div>

 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="js/bootstrap.js"></script>

 

</body>

</html>