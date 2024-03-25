<%@ page contentType="text/html; charset=UTF-8"%>

<header>
	<div class="logo" id="logo">
		<a href="./homeController.jsp" class="homeBtn"><img
			src="./images/mainLogo.PNG" /></a>
	</div>

	<div class="navigator">
		<a href="./homeController.jsp" class="homeBtn">Home</a>
		<a href="./testController.jsp" class="testBtn">Test</a>
		<a href="./mapController.jsp" class="mapBtn">Counseling Center</a>
		<!-- <a href="./loginCtrl.jsp" class="loginBtn">Log In</a> -->
		${ loginBtn }
		<% if(session.getAttribute("loginId") != null){ %>
		<br /> ${ logoutBtn } 
		<%} %>
	</div>

</header>
<!-- <hr class="endHeader" /> -->