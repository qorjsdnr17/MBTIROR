function renderList() {
    let mbtiList = [
        "istj", "isfj", "infj", "intj", "istp", "isfp", "infp", "intp"
        , "estp", "esfp", "enfp", "entp", "estj", "esfj", "enfj", "entj"
    ];

    for (let i = 0; i < mbtiList.length; i++) {
        let index = i + 1;
        let mbti = mbtiList[i];
        let listTemplate =
                          // `<div class ="box" id=box0${index}>`
                         + `<a href="./list.html?mbti=${mbti}">`
                         //+ `</div>`;
        document.querySelector('#list').innerHTML += listTemplate;
    }
}

function init() {
    renderList();
}