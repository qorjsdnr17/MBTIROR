// dummy data를 생성하는 js입니다. js는 js폴더 안에, json파일은 html과 같은 폴더에 위치시켜주세요.
// home.html에 <script src="js/dummy.js"></script> 한줄을 추가해주세요.
// 기존 로컬스토리지를 싹 날려버리는 방식으로 제작되었습니다. 원하시지 않을 경우 아래에서 주석 처리 또는 삭제해주세요.

var dummy;

//더미 제이슨 파일을 서버로 불러오기
function loadDummy() {
  var xhr = new XMLHttpRequest();
  xhr.open("get", "dummy.json", false);
  xhr.send();

  dummy = JSON.parse(xhr.responseText);
}

//로컬스토리지에 제이슨 파일의 정보들을 저장하기. dummy 파일 안에 hash 값을 포함시켰습니다.
function setDummy() {
  localStorage.clear(); // 기존 로컬리지 초기화
  for (let i in dummy) {
    localStorage.setItem(dummy[i].hash, JSON.stringify(dummy[i]));
  }

  localStorage.setItem("postNum", 16); //dummy포스트의 갯수가 16개이므로.
}

function init() {
  loadDummy();
  setDummy();
}

window.addEventListener("load", init);
