<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@  page import="java.io.PrintWriter"%>
<%@  page import="bbs.BbsDAO"%>
<%@  page import="bbs.Bbs"%>
<%@  page import="java.util.ArrayList"%>
<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 뷰포트 -->

<meta name="viewport" content="width=device-width" initial-scale="1">

<!-- 스타일시트 참조  -->

<link rel="stylesheet" href="css/bootstrap.min.css">

<title>Shopping Mall</title>
<style type="text/css">
	a, a:hover {
		color: #000000;
		text-decoration: none;
	}
</style>

</head>

<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		// 기본페이지의 넘버는 1
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
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
 		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; margin: 20px">
 			<thead>
 				<tr>
 					<th style="background-color: #eeeeee; text-align: center;">번호</th>
 					<th style="background-color: #eeeeee; text-align: center;">제목</th>
 					<th style="background-color: #eeeeee; text-align: center;">작성자</th>
 					<th style="background-color: #eeeeee; text-align: center;">작성일</th>
 				</tr>
 			</thead>
 				<tbody>
 				<%
 					BbsDAO bbsDAO = new BbsDAO();
 					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
 					for(int i = 0; i < list.size(); i++) {
 				%>
	 				<tr>
						<td><%= list.get(i).getBbsID() %></td>
						<td><a href="view.jsp?bbsID=<%= list.get(i).getBbsID()%>"><%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11, 13) + "시" + list.get(i).getBbsDate().substring(14, 16) + "분" %></td>
	 				</tr>
 				<%
 					}
 				%>
 					
 				</tbody>
 		</table>
 		<%
 			if(pageNumber != 1) {
 		%>
 			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left" style="margin-left: 40px">이전</a>
 		<%
 			} if(bbsDAO.nextPage(pageNumber + 1)) {
 		%>
 			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left" style="margin-left: 40px">다음</a>
 		<%	
 			}
 		%>
 		<a href="write.jsp" class="btn btn-primary pull-right" style="margin-right: 40px">글쓰기</a>
 	</div>
 </div>

 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="js/bootstrap.js"></script>

 

</body>

</html>