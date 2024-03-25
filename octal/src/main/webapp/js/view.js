// board_title <- list,mbti 데이터 불러 오기,저장

let mbti, hash;
let post = {};

function changeTitle() {
  document.querySelector(".board_title strong").innerHTML =
    getMBTI() + " 게시판";
  document.querySelector(".board_title p").innerHTML = returnDesc(getMBTI());

  document.querySelector(".bt_wrap").innerHTML =
    '<a href="list.html?mbti=' +
    mbti +
    '" id="on">목록</a><a href="edit.html?mbti=' +
    mbti +
    "&hash=" +
    hash +
    '" id="edit">수정</a><a id="recommBtn">추천</a>';
}

// title, board_view <- write 데이터 불러 오기,저장

let title, info;

function getParameter(paramName, paramValue) {
  let parameter = {
    paramName: paramName,
    paramValue: paramValue,
  };

  return parameter;
}

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
          console.log(paramValue);
          break;
        }
      }
      return paramValue;
    },
  };
  console.log(parameters);
  return parameters;
}

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

function viewListHandler() {
  post = JSON.parse(localStorage.getItem(hash));

  title.innerHTML = post.title;
  postNum.innerHTML = post.postNum;
  writer.innerHTML = post.writer;
  date.innerHTML = post.date;
  view.innerHTML = post.view;
  cont.innerHTML = post.content;
}

function onHandler() {
  title = document.querySelector("#title");
  postNum = document.querySelector("#postNum");
  writer = document.querySelector("#writer");
  date = document.querySelector("#date");

  date = new Date();
  date = new Intl.DateTimeFormat(locale, options).format(date);

  hash = setHash();

  post = createPost();
  localStorage.setItem(hash, JSON.stringify(post));

  window.location.href = "./view.html?mbti=" + getMBTI() + "&hash=" + hash;
}

function edit1Handler() {
  title = document.querySelector("#title");
  postNum = document.querySelector("#postNum");
  writer = document.querySelector("#writer");
  date = document.querySelector("#date");

  date = new Date();
  date = new Intl.DateTimeFormat(locale, options).format(date);

  post = createPost();
  localStorage.setItem(hash, JSON.stringify(post));

  window.location.href = "./edit.html?mbti=" + getMBTI() + "&hash=" + hash;
}

function recommHandler() {
  post.recomm += 1;
  document.querySelector("#recommValue").innerHTML = post.recomm;
  localStorage.setItem(hash, post);
}

function init() {
  (mbti = getMBTI()), (hash = getHash());

  changeTitle();

  title = document.querySelector("#title");
  postNum = document.querySelector("#postNum");
  writer = document.querySelector("#writer");
  date = document.querySelector("#date");
  cont = document.querySelector(".cont");
  recommBtn = document.querySelector("#recommBtn");

  viewListHandler();
  document.querySelector("#on").addEventListener("click", onHandler);
  document.querySelector("#edit").addEventListener("click", edit1Handler);
  recommBtn.addEventListener("click", recommHandler);
}

/////////////////////////////////////////////

//////////////////////////////////////////////
//sns 공유

function fn_sendFB(sns) {
  var thisUrl = document.URL;
  var snsTitle = "MBTI + MIRROR";
  if (sns == "facebook") {
    var url =
      "http://www.facebook.com/sharer/sharer.php?u=" +
      encodeURIComponent(thisUrl);
    window.open(url, "", "width=486, height=286");
  } else if (sns == "twitter") {
    var url =
      "http://twitter.com/share?url=" +
      encodeURIComponent(thisUrl) +
      "&text=" +
      encodeURIComponent(snsTitle);
    window.open(url, "tweetPop", "width=486, height=286,scrollbars=yes");
  } else if (sns == "band") {
    var url =
      "http://www.band.us/plugin/share?body=" +
      encodeURIComponent(snsTitle) +
      "&route=" +
      encodeURIComponent(thisUrl);
    window.open(url, "shareBand", "width=400, height=500, resizable=yes");
  }
}

//////////////////////////////////////

window.addEventListener("load", init);

btn.onclick = pressBtn;
