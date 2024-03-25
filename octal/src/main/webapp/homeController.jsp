<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <jsp:useBean id="LoginBean" class="LoginBean" />
<jsp:setProperty name="LoginBean" property="*" /> --%>

<%
String viewPath = "/WEB-INF/views/";
String container = "boardLink.jsp";
String loginBtn = "<a href='./loginController.jsp' class='loginBtn'>Log In</a>";
String logoutBtn = "<form method='post'><input type='hidden' name='command' value='logout'><button type='submit'>Log Out</button></form>";

/* if(session.getAttribute("isLogin") == true) {
	loginBtn = 
} */

if (session.getAttribute("loginId") == null) {

	/* Container Control */
	/* session.setAttribute("container", "<jsp:include page=" + container + " />"); */
	/* session.setAttribute("container", "boardLink.jsp"); */
	request.setAttribute("container", container);

	/* Navi Control */
	session.setAttribute("loginBtn", loginBtn);
	pageContext.forward(viewPath + "home.jsp");

} else if (session.getAttribute("loginId") != null) {
	if (request.getMethod().equals("POST") && request.getParameter("command") != null && request.getParameter("command")
	.equals("logout")) {
		//logout 버튼 클릭 시, 로그인 정보 삭제 및 현재 페이지 재호출
		session.invalidate();
		response.sendRedirect("homeController.jsp");
	} else {

		//로그인 되어 넘어온 세션을 유지 및 home.jsp 호출
		request.setAttribute("container", container);
		loginBtn = session.getAttribute("loginId") + "님 환영합니다!";
		session.setAttribute("loginBtn", loginBtn);
		session.setAttribute("logoutBtn", logoutBtn);
		pageContext.forward(viewPath + "home.jsp");
	}
}
%>