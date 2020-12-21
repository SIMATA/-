<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="product.Product"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="java.io.PrintWriter"  %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "bbs" class="bbs.Bbs" scope="page"/>  
<jsp:setProperty name="bbs" property="bbsTitle"/> 
<jsp:setProperty name="bbs" property="bbsContent"/> 

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Shopping Mall</title>

</head>
<body>
	<%
		// 이미 로그인 되어있으면..
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하셔야합니다!')");
			script.println("location.href = 'login.jsp'"); //로그인 페이지로 되돌리기
			script.println("</script>");
		} else {
			if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('빈칸이 존재합니다!')");
						script.println("history.back()"); //이전페이지로 되돌리기
						script.println("</script>");
					} else {
						BbsDAO bbsDAO = new BbsDAO();
						int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
						if (result == -1) {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기 실패입니다...')");
							script.println("history.back()"); //이전페이지로 되돌리기
							script.println("</script>");
						}
						else {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href = 'bbs.jsp'");
							script.println("</script>");
						}
		}
		
		}
	%>
 
</body>
</html>