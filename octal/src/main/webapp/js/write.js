//최종수정일시 : 230807 14:38

let post, postNum, mbti, hash;
let title, writer, passwd, content, date, recomm;

function changeTitle() {
  document.querySelector(".board_title strong").innerHTML = mbti + " 게시판";
  document.querySelector(".board_title p").innerHTML = returnDesc(mbti);
}

let dummyPost = {
  title: "안녕? ENFP게시판에 온 걸 환영해!",
  postNum: 1,
  writer: "김휴고",
  passwd: "1234",
  content: "하지만 내용은 없어!",
  date: "2023년 8월 4일 금요일 오후 2:11",
  recomm: 0,
};

//작성일시 포맷 옵션
const options = {
  hour: "numeric", // 시간은 숫자로
  minute: "numeric", // 분도 숫자로
  day: "numeric", // 날도 숫자로
  month: "long", // 달은 글자로
  year: "numeric", // 연도는 숫자로
  weekday: "long", // 요일은 글자로
};
const locale = navigator.language; //브라우저가 사용하는 언어 확인. 해당 언어로 시간 표기하기 위해

// 1. url로부터 게시판 정보 받아오는 기능들

//parameter 이름과 값을 저장하는 객체 생성
function getParameter(paramName, paramValue) {
  let parameter = {
    paramName: paramName,
    paramValue: paramValue,
  };

  return parameter;
}

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

//주소창에서 MBTI 문자열을 반환한다
function getMBTI() {
  let urlSearch = window.location.search;
  let parameters = getParameters(urlSearch);
  let mbti = parameters.getParamValue("mbti");

  return mbti;
}

function getHash() {
  let urlSearch = window.location.search;
  let parameters = getParameters(urlSearch);
  let hash = parameters.getParamValue("hash");

  return hash;
}

// 2. 게시글을 저장하기 위해 필요한 정보를 가공, 생성하는 기능들

//게시물 정보를 담은 JSON객체를 반환하는 기능
function createPost() {
  post = {
    title: title,
    postNum: postNum,
    writer: writer,
    passwd: passwd,
    content: content,
    date: date,
    views: 0,
    recomm: 0,
  };

  return post;
}

//글번호 로컬에서 불러오기 또는 생성
function setPostNum() {
  if (localStorage.getItem("postNum")) {
    postNum = Number(localStorage.getItem("postNum")) + 1;
  } else {
    postNum = 1;
  }
  //글번호 로컬로 저장
  localStorage.setItem("postNum", postNum);

  return postNum;
}

//이 게시물의 hash를 생성 및 반환.
/* 작성자와 시간을 활용하여 Hash값을 생성하려 했으나,
    로컬스토리지에 현재 몇 개의 값이 저장되어 있는지와
    키 값을 해석하기가 난해하여, 글 번호와 게시판 정보를 키로 활용하기로 함.
*/
function setHash() {
  //hash를 MBTI와 게시물 번호로 지정
  hash = mbti + "+" + String(setPostNum());

  return hash;
}

//비밀번호 유효성 검사. 하나 이상의 영어대소문자와 숫자, 특수문자 포함, 6글자 이상.
function isPasswd() {
  const condition =
    /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{6,}$/;

  return condition.test(passwd);
}

//post 정보를 저장 및 해당 글 view페이지로 이동
function saveHandler() {
  title = document.querySelector(".board_write_wrap #title").value;
  writer = document.querySelector(".board_write_wrap #writer").value;
  passwd = document.querySelector(".board_write_wrap #passwd").value;
  content = document.querySelector(".board_write_wrap #content").value;
  date = new Date();
  date = new Intl.DateTimeFormat(locale, options).format(date);

  //모든 정보가 채워졌는지 검사
  if (title && writer && passwd && content) {
    //비밀번호 유효성 검사
    if (isPasswd()) {
      //postNum과 hash 생성
      hash = setHash();

      //post json 생성
      post = createPost();
      //post json을  로컬에 저장
      localStorage.setItem(hash, JSON.stringify(post));

      //모든 작업을 끝내고 해당 게시물 view페이지로 이동
      window.location.href = "./view.html?mbti=" + mbti + "&hash=" + hash;
    } else {
      alert(
        "비밀번호는 하나 이상의 영어 대, 소문자와 숫자, 특수문자를 포함해야 하며 6글자 이상이어야 합니다."
      );
    }
  } else {
    alert("모든 필드를 채워주세요!");
  }
}

function cancelHandler() {
  let cancel = window.confirm(
    "작성 중인 내용이 모두 사라집니다. 계속하시겠습니까?"
  );
  if (cancel) {
    window.location.href = "./list.html?mbti=" + mbti;
  }
}

function init() {
  document.querySelector("#save").addEventListener("click", saveHandler);
  document.querySelector("#cancel").addEventListener("click", cancelHandler);

  mbti = getMBTI();
  hash = getHash();
  changeTitle();
}

window.addEventListener("load", init);
