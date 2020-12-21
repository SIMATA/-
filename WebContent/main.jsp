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
 
<html>
  <head>
    <title>shopping mall</title>
    <meta charset="utf-8" />
    <link href="css/styles.css" rel="stylesheet">
  </head>

  <body>
    <div class="side-navbar">
      <a href="#" id="logo">
        <img src="images/logo.png" width='149'>
      </a>
    </div>

      <div class="hero-header"></div>
      <div class="main-index">
        <p>Our New Products</p>
      </div>

      <div class="grid-align">
        <div class="products"><a href="sunglasses.jsp">
          <div class="grid Sunglasses"></div>
            <p class="product-font">Sunglasses</p>
            <p class="price-font">49,000</p>
          </a>
        </div>

        <div class="products"><a href="tassel_loafer.jsp">
          <div class="grid tassel-loafer"></div>
            <p class="product-font">tassel loafer</p>
            <p class="price-font">89,000</p>
          </a>
        </div>

        <div class="products"><a href="Berige_Bag.jsp">
          <div class="grid beige-bag"></div>
            <p class="product-font">Berige Bag</p>
            <p class="price-font">69,000</p>
          </a>
        </div>
        <div class="clearfix"></div>
      </div>

      

        <div class="grid-align">
          <div class="products"><a href="Sneakers.jsp">
            <div class="grid sneakers"></div>
              <p class="product-font">Sneakers</p>
              <p class="price-font">79,000</p>
            </a>
          </div>

          <div class="products"><a href="Slipers.jsp">
            <div class="grid slippers"></div>
              <p class="product-font">Slipers</p>
              <p class="price-font">29,000</p>
            </a>
          </div>

          <div class="products"><a href="Wrist_Watch.jsp">
            <div class="grid wrist-watch"></div>
              <p class="product-font">Wrist Watch</p>
              <p class="price-font">99,000</p>
            </a>
          </div>  
          <div class="clearfix"></div>
        </div>

      
      <div class="grid-align">
        <div class="products"><a href="fedora_hat.jsp">
          <div class="grid fedora-hat"></div>
            <p class="product-font">Fedora Hat</p>
            <p class="price-font">39,000</p>
          </a>
        </div>

        <div class="products"><a href="Classic_Loafer.jsp">
          <div class="grid classic-loafer"></div>
            <p class="product-font">Classic Loafer</p>
            <p class="price-font">99,000</p>
          </a>
        </div>

        <div class="products"><a href="Pink_Bag.jsp">
          <div class="grid pink-bag"></div>
            <p class="product-font">Pink Bag</p>
            <p class="price-font">79,000</p>
          </a>
        </div>
        <div class="clearfix"></div>
      
  <div class="logo-icon">
    <a href="https://facebook.com"><img src="images/facebook.png"></a>
    <a href="https://instagram.com"><img src="images/instagram.png"></a>
    <a href="https://twitter.com"><img src="images/twitter.png"></a>
  </div>
  
  </body>
</html>


 <!-- 애니매이션 담당 JQUERY -->

 <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 

 <!-- 부트스트랩 JS  -->

 <script src="js/bootstrap.js"></script>

 

</body>

</html>