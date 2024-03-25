<%@ page contentType="text/html; charset=UTF-8"%>
<%-- <jsp:useBean id="LoginBean" class="LoginBean" />
<jsp:setProperty name="LoginBean" property="*" /> --%>

<%
String viewPath = "/WEB-INF/views/";
String container = "boardLink.jsp"; // 추후 mapLink.jsp 로 변경
String loginBtn = "<a href='./loginController.jsp' class='loginBtn'>Log In</a>";

/* if(session.getAttribute("isLogin") == true) {
	loginBtn = 
} */

if (request.getMethod().equals("GET")) {
	/* Container Control */
	/* session.setAttribute("container", "<jsp:include page=" + container + " />"); */
	/* session.setAttribute("container", "boardLink.jsp"); */
	request.setAttribute("container", container);
	
	/* Navi Control */
	session.setAttribute("loginBtn", loginBtn);

	pageContext.forward(viewPath + "home.jsp");
} else if (request.getMethod().equals("POST")) {
	//로그인 되어 넘어온 세션을 유지 및 home.jsp 호출
	
	request.setAttribute("container", container);
	loginBtn = "(userId)님 환영합니다!";
	session.setAttribute("loginBtn", loginBtn);
	
	pageContext.forward(viewPath + "home.jsp");

}
%>