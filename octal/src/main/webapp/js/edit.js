/*
  json객체를 사용한 방법, 바로 이전에 작성된 게시물을 가져오는 방법
*/

let mbti, hash;
let post = {};

// -----MBTI별 게시판 제목을 수정 시작-----
function changeTitle() {
  document.querySelector(".board_title strong").innerHTML = getMBTI() + " 게시판";
  document.querySelector(".board_title p").innerHTML = returnDesc(getMBTI());

  // 수정 링크와 이전 링크를 동적으로 생성하여 .bt_wrap 클래스를 가진 요소에 삽입
   //document.querySelector(".bt_wrap").innerHTML = '<a href="view.html?mbti=' + mbti + '" id="edit">수정</a><a href="view.html?mbti=' + mbti + '&hash=' + hash + '" id="previous">이전</a>';
}
// -----MBTI별 게시판 제목을 수정 끝-----

// -----url로부터 게시판 정보 받아오는 기능들 시작-----
//parameter 이름과 값을 저장하는 객체 생성
function getParameter(paramName, paramValue) {
let parameter = {
  paramName: paramName,
  paramValue: paramValue
  };

  return parameter;
}

//url로부터 쿼리를 받아 분석하는 함수로 객체를 반환. 이 객체는 모든 parameter 이름과 값, 그리고 원하는 parameter를 찾는 함수를 포함.
//parameter 이름과 값을 저장하는 객체 생성


//url로부터 쿼리를 받아 분석하는 함수로 객체를 반환. 이 객체는 모든 parameter 이름과 값, 그리고 원하는 parameter를 찾는 함수를 포함.
function getParameters(search) {
  let params = search.substr(1).split("&");

  for (let i in params) {
    param = params[i].split("=");
    params[i] = getParameter(param[0], param[1]);
  }

  let parameters = {
    params: params,

    getParamValue: function (paramName) {
      let paramValue = "";

      for (let i in params) {
        if (params[i].paramName === paramName) {
          paramValue = params[i].paramValue;
          
          break;
        }
      }
      return paramValue;
    },
  };
  
  return parameters;
}

//주소창에서 MBTI문자열(mbti=istj)을 반환한다
function getMBTI() {
let urlSearch = window.location.search;
let parameters = getParameters(urlSearch);
let mbti = parameters.getParamValue("mbti");

return mbti;
}

// 주소창에 hash문자열(hash=istj+1)를 반환한다
function getHash() {
  let urlSearch = window.location.search;
  let parameters = getParameters(urlSearch);
  let hash = parameters.getParamValue("hash");

  return hash;
}
// -----url로부터 게시판 정보 받아오는 기능들 끝-----


// ------------------------------------------------------------------
// -----비밀번호 관련 코드 시작-----
// 비밀번호를 정규표현식으로 검증하는 함수
function validatePassword(password) {
  // 비밀번호는 하나 이상의 영어 대, 소문자와 숫자, 특수문자를 하나 포함해야 하며 6글자 이상이어야 하는 정규표현식
  let passwordRegex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$/;
  return passwordRegex.test(password);
}

// 비밀번호 시도 횟수를 가져오는 함수
function getAttempts() {
  let attempts = localStorage.getItem('attempts');
  return attempts ? parseInt(attempts) : 0;
}

// 비밀번호 시도 횟수를 저장하는 함수
function saveAttempts(attempts) {
  localStorage.setItem('attempts', attempts.toString());
}
// -----비밀번호 관련 코드 끝-----



// -----editHandler 코드 시작 -----
// 이전의 데이터를 가져와서 수정할데이터로 변환하는 목적
function editHandler() {
  let previousPassword = post.passwd;
  let newPassword = passwd.value;

  // 비밀번호가 작성시 비밀번호와 지금입력한 비밀번호가 같은지 확인
  // 정규표현식에 맞는 비밀번호인지 확인
  if (previousPassword === newPassword && validatePassword(newPassword)) {
    post.title = title.value;
    post.writer = writer.value;
    post.passwd = passwd.value;
    post.content = content.value;
    

    // 수정된 데이터를 localStorage에 저장
    localStorage.setItem(hash, JSON.stringify(post));

    alert("수정되었습니다");

    window.location.href = "./view.html?mbti=" + mbti + "&hash=" + hash;

  // 비밀번호가 일치하지않고, 규칙에 맞지않는 경우
  } else {

    let attempts = getAttempts();
    attempts++;
    saveAttempts(attempts);

    // 비밀번호 실패 3번하면 이전데이터를 가져와서
    // view페이지로 돌아가게함
    if(attempts >= 3){
      // 비밀번호 시도 횟수 초기화
      saveAttempts(0);
      
      post = JSON.parse(localStorage.getItem(hash));


      // 해당 게시판을 구분하여 데이터를 가져와서 html에 채움
      title.value = post.title;
      writer.value = post.writer;
      content.value = post.content;

      // 비밀번호만 빈칸으로 초기화
      passwd.value = '';

      alert("비밀번호 3회 실패로 현재 작성한 내용이 초기화되었습니다. 이전 페이지로 돌아갑니다.");

      // view.html로 돌아가기
      window.location.href = "./view.html?mbti=" + mbti + "&hash=" + hash;
            

    }else{
    // 비밀번호를 3번 미만으로 실패했을 경우
    // 비밀번호만 초기화하여 비밀번호만 올바르게 작성할수있는 기회를 3번줌
    // 게시물 정보를 다시 화면에 표시
    passwd.value = '';

    alert("비밀번호를 다시 입력해주세요." 
    + "\n비밀번호는 하나 이상의 영어 대, 소문자와 숫자, 특수문자를 하나 포함해야 하며"
    + "\n6글자 이상입니다.");

    // view.html로 돌아가지 않게 기본이벤트중지메서드 실행
    event.preventDefault();
    }
  }
}

// -----editHandler 코드 끝 -----



// previousHandler 함수에서는 이전 데이터를 가져와서 view페이지로 돌아가는것이 목적
function previousHandler() {
  post = JSON.parse(localStorage.getItem(hash));

  // 해당 게시판을 구분하여 데이터를 가져와서 html에 채움
  title.value = post.title;
  writer.value = post.writer;
  passwd.value = '';
  content.value = post.content;

}

function previous_viewHandler() {
  window.location.href = "./view.html?mbti=" + mbti + "&hash=" + hash;
}

// -----html에 연결하는 init함수 시작-----
function init() {
  mbti = getMBTI();
  hash = getHash();

  title = document.querySelector('#title');
  writer = document.querySelector('#writer');
  passwd = document.querySelector('#passwd');
  content = document.querySelector('#content');

  changeTitle();
  previousHandler();
  
  document.querySelector('#edit').addEventListener('click', editHandler);
  
  document.querySelector('#previousView').addEventListener('click', previous_viewHandler);
}
// -----html에 연결하는 init함수 끝-----

window.addEventListener('load', init);