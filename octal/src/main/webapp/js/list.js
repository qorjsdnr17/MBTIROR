/**
 * list.html 로드시 실행될 순서
 */
function listInit() {
  const queryString = window.location.search;
  const params = new URLSearchParams(queryString);
  const mbti = params.get("mbti");
  const hash = params.get("hash");
  makeHeader(mbti);
  writeList(mbti);
}

/**
 * mbti list 페이지 헤더.
 * @param {String} value mbti값.
 */
function makeHeader(value) {
  document.querySelector("#title").innerHTML = value;
  document.querySelector(".board_title strong").innerHTML = returnDesc(value);
  document.querySelector(
    ".board_wrap .bt_wrap"
  ).innerHTML = `<a href="write.html?mbti=${value}" class="on">글쓰기</a>`;
}

/**
 * 설명문을 돌려준다.
 * @param {string} mbti mbti값
 * @returns mbti값에 맞춘 설명문
 */
function returnDesc(mbti) {
  switch (mbti) {
    case "istj":
      return "청렴결백한 논리주의자";
    case "isfj":
      return "용감한 수호자";
    case "infj":
      return "선의의 옹호자";
    case "intj":
      return "용의주도한 전력가";
    case "istp":
      return "만능 재주꾼";
    case "isfp":
      return "호기심 많은 예술가";
    case "infp":
      return "열정적인 중재자";
    case "intp":
      return "논리적인 사색가";
    case "estp":
      return "모험을 즐기는 사업가";
    case "esfp":
      return "자유로운 영혼의 연예인";
    case "enfp":
      return "재기발랄한 활동가";
    case "entp":
      return "뜨거운 논쟁을 즐기는 변론가";
    case "estj":
      return "엄격한 관리자";
    case "esfj":
      return "사교적인 외교관";
    case "enfj":
      return "정의로운 사회운동가";
    case "entj":
      return "대담한 통솔자";
    default:
      return "관리자 페이지";
  }
}

/**
 * 페이지 글 목록
 * @param {String} value mbti값.
 */
function writeList(mbti) {
  let postKeys = [];
  //mbti와 로컬스토리지의 키 값이 동일하면 키를 postKeys 배열에 추가한다.
  for (let i = 0; i < localStorage.length; i++) {
    let keys = localStorage.key(i);
    let keysSplit = keys.split("+");

    if (keysSplit[0] == mbti) {
      postKeys.push(keys);
    }
  }

  //postKeys배열에 저장된 키를 통해 post 배열에 json객체를 저장.
  let post = [];
  let content = "";
  for (let i in postKeys) {
    post[i] = JSON.parse(localStorage.getItem(postKeys[i]));
    content += '<div class="num">' + post[i].postNum + "</div>";
    content +=
      '<div class="title"><a href="view.html?mbti=' +
      mbti +
      "&hash=" +
      postKeys[i] +
      '">' +
      post[i].title +
      "</a> </div>";
    content += '<div class="writer">' + post[i].writer + "</div>";
    content += '<div class="date">' + post[i].date + "</div>";
    content += '<div class="count">' + post[i].view + "</div>";
  }


  document.querySelector("#article_list").innerHTML += content;
}



//검색 기능. 미완성
function beforeSearch() {
  let searchText = document.querySelector("[name=condition]").value;

  if (searchText === "") {
    alert("검색어를 입력하세요.");
    return;
  }
  //검색 조건. 미완성
  let searchOption = document.querySelector(".opt").value;
  let data = JSON.parse(localStorage.getItem("data"));
  switch (searchOption) {
    case "0": // 제목
      for (let i = 0; i < data.length; i++) {
        let obj = data[i];
        if (obj.subject.includes(searchText)) {
          document.querySelector("#article_list").innerHTML = "";
          let listTemplate =
            `<div class="num">${obj.num}</div>` +
            `<div class="title"><a href="${obj.link}">` +
            `${obj.subject}` +
            "</a></div>" +
            `<div class="writer">${obj.writer}</div>` +
            `<div class="date">${obj.date}</div>` +
            `<div class="count">${obj.count}</div>`;
          document.querySelector("#article_list").innerHTML += listTemplate;
        }
      }
      break;
    case 1: // 내용 : 기능구현 고민..
      break;
    case 2: // 제목 : 기능구현 고민..
      break;
    case 3: // 글쓴이
      break;
  }
}
