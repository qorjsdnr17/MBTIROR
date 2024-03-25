<%@ page contentType="text/html; charset=UTF-8" import="java.util.*, java.text.SimpleDateFormat, DAO.*, DO.*" %>

<jsp:useBean id="userInfoBean" class="DAO.UserInfoDAO" scope="session" />
<jsp:setProperty name="userInfoBean" property="*" />

<%
	if(request.getMethod().equals("POST")){
		request.setCharacterEncoding("UTF-8");
	}	

	String viewPath = "/WEB-INF/views/";
	String command = request.getParameter("command");
	UserInfoDAO userDAO = (UserInfoDAO) session.getAttribute("userDAO");
	
	if(userDAO == null){
		userDAO = new UserInfoDAO();
		session.setAttribute("userDAO", userDAO);
	}
	
	UserInfoDO userDO = new UserInfoDO();
	
	// 아이디가 db에서 중복된 id라면 입력칸 위에 빨간글씨로 알려주고, 다시 아이디 입력
	
	// 비밀번호와 비밀번호 확인칸을 중복검사하고 다르면 입력칸 위에 빨간글씨로 알려주고, 비밀번호만 다시 입력
	
	// 한칸이라도 null이면 입력칸 위에 빨간글씨로 알려주고, 그 칸만 다시 입력
	// 비밀번호칸이 null이라면 각 입력칸 위에 빨간글씨로 알려주고, 비밀번호칸과 비밀번호 확인칸을 다시 입력
	
	// 회원가입이 되었다면 회원가입완료 멘트를 알리고, 로그인창으로 전환
	
	// mbti도 대문자영어 네자리만 아니라면 입력칸 위에 빨간글씨로 알려주고, 그 칸만 다시 입력
	
	if(request.getMethod().equals("GET")){
		pageContext.forward(viewPath + "join.jsp");
	}else if(request.getMethod().equals("POST") && command != null && command.equals("join")){
		// 회원가입 처리
        try{
            String userNoParam = request.getParameter("userNo");
            if (userNoParam != null && !userNoParam.isEmpty()) {
                userDO.setUserNo(Integer.parseInt(userNoParam));
            } 
        } catch (NumberFormatException e) {
            // 숫자로 변환할 수 없는 경우에 대한 처리
            e.printStackTrace();
        }
		userDO.setUserId(request.getParameter("userId"));
		userDO.setPassWd(request.getParameter("passWd"));
		
		String joinDateStr = request.getParameter("joinDate");
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date joinDate = null;

		try {
			joinDate = new Date(); // 현재 날짜와 시간을 생성
			String formattedDate = dateFormat.format(joinDate); // SimpleDateFormat을 사용하여 형식화된 날짜 문자열을 얻음
			joinDate = dateFormat.parse(formattedDate); // 문자열을 다시 Date로 변환
			userDO.setJoinDate(joinDate); // userDO에 저장
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("날짜 형식이 올바르지 않습니다.");
			return;
		}
		userDO.setEmail(request.getParameter("email"));
		userDO.setMbti(request.getParameter("mbti"));
		
		int rowCount = userDAO.insertUserInfo(userDO);
		
		System.out.println(rowCount);
		
		if (rowCount > 0) {
		    // 회원가입 성공
		    response.sendRedirect("loginController.jsp");
		    // System.out.println("회원가입 성공");
		} else {
		    // 회원가입 실패
			response.sendRedirect("joinController.jsp");
			
		}
	}else if(request.getMethod().equals("POST") && command != null && command.equals("home")){
		 // pageContext.forward(viewPath + "home.jsp");
		 response.sendRedirect("homeController.jsp");
	}
%>
