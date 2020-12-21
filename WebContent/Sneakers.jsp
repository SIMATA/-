<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@  page import="java.io.PrintWriter"%>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.css">
<link href="css/styles.css" rel="stylesheet">

<title>Shopping Mall</title>

</head>
<body>

<a href="main.jsp"><img src="images/logo.png" width="100" height="20" /></a>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		int productID = 4;
		if (request.getParameter("productID") != null){
			productID = Integer.parseInt(request.getParameter("productID"));
		}
		if (productID != 4) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 상품입니다!')");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		Product product = new ProductDAO().getProduct(productID);
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
    <li class="active"><a href="main.jsp">메인</a></li>
    <li><a href="bbs.jsp">주문하기</a></li>
	
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
 		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin: 20px">
 			<thead>
 				<tr>
 					<th colspan="3" style="background-color: #eeeeee; text-align: center;">상품 내용</th>
 					
 				</tr>
 			</thead>
 				<tbody>
 					<tr>
 						<td style="width: 20%;">상품번호</td>
 						<td colspan="2"><%= product.getProductID()%></td>
 					</tr>
 					<tr>
 						<td>상품명</td>
 						<td colspan="2"><%= product.getProductName() %></td>
 					</tr>
 					<tr>
 						<td>상품가격</td>
 						<td colspan="2"><%= product.getPrice() %></td>
 					</tr>
 					<tr>
 						<td>상품내용</td>
 						<td colspan="2" style = "height: 300px; text-align: middle;"><%= product.getDescription()%></td>
 						<div class="grid sneakers" style = "text-align: center; margin:auto;">
 						<a onclick="return confirm('주문제작을 위해서 정보를 정확히 입력해주세요!')" href="bbs.jsp" class="btn btn-primary" style = "margin-left : 250px; margin-top : 200px;">구매하기</a>
 						</div>
 					</tr>
 				</tbody>
 			</table>
 	</div>
 </div>
 
  

 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="js/bootstrap.js"></script>
</body>

</html>