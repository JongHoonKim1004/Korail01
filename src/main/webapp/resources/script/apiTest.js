/**
 *
 */

// Route Search
var depPlaceId = null;
var arrPlaceId = null;

var button = document.getElementById("submit");

const cityCodes = [
  11, 12, 21, 22, 23, 24, 25, 26, 31, 32, 33, 34, 35, 36, 37, 38,
];

// func1 : call StationCode

function getStationCode(station, cityCodes) {
  return Promise.all(
    cityCodes.map((cityCode) => {
      return $.ajax({
        url: `http://apis.data.go.kr/1613000/TrainInfoService/getCtyAcctoTrainSttnList?serviceKey=zQw6PXo%2BVD46UR4OpCnBT9jFkLL7ubkMP%2BFjVV%2FhHxAPkCCzZlpeUqkfBdHoYo589oaV4IgJkJytB7R%2FYbilXg%3D%3D&pageNo=1&numOfRows=50&_type=json&cityCode=${cityCode}`,
        method: "GET",
      })
        .then((result) => {
          //console.log(result);
          for (var i = 0; i < result.response.body.items.item.length; i++) {
            if (result.response.body.items.item[i].nodename === station) {
              return result.response.body.items.item[i].nodeid;
            }
          }
        })
        .catch((error) => {
          console.error("역 검색 중 에러 발생 : " + error);
        });
    })
  );
}

// func3 Search Route
function searchTrainLoute(depPlaceId, arrPlaceId, depPlandTime) {
  $.ajax({
    url: `http://apis.data.go.kr/1613000/TrainInfoService/getStrtpntAlocFndTrainInfo?serviceKey=zQw6PXo%2BVD46UR4OpCnBT9jFkLL7ubkMP%2BFjVV%2FhHxAPkCCzZlpeUqkfBdHoYo589oaV4IgJkJytB7R%2FYbilXg%3D%3D&pageNo=1&numOfRows=200&_type=json&depPlaceId=${depPlaceId}&arrPlaceId=${arrPlaceId}&depPlandTime=${depPlandTime}`,
    method: "GET",
  })
    .then((result) => {
      $(".api-result").empty();
      console.log(result);
      
      var item = result.response.body.items.item;
      var count = result.response.body.totalCount;

      for (var i = 0; i < count; i++) {
        createForm(i,item[i]);
      }
    })
    .catch((error) => {
      console.error("노선 검색중 에러 발생 : " + error);
    });
}

/*
<div class="card">
<form action="#" method="post" enctype="multipart/form-data" class="form-horizontal">
<sec:csrfInput/>
<div class="card-body card-block">
    <div class="row form-group">
      <div class="col col-md-3">
        <label for="dep_place${i}" class=" form-control-label">출발역</label>
      </div>
      <div class="col-12 col-md-9">
        <input type="text"  name="dep_place${i}" readonly class="form-control" value="${}">
      </div>
    </div>
    <div class="row form-group">
    <div class="col col-md-3"><label for="dep_place${i}" class=" form-control-label">출발역</label></div>
    <div class="col-12 col-md-9"><input type="text"  name="dep_place${i}" readonly class="form-control" value="${}"></div>
    </div>
    <div class="row form-group">
    <div class="col col-md-3"><label for="dep_place${i}" class=" form-control-label">출발역</label></div>
    <div class="col-12 col-md-9"><input type="text"  name="dep_place${i}" readonly class="form-control" value="${}"></div>
    </div>
    <div class="row form-group">
    <div class="col col-md-3"><label for="dep_place${i}" class=" form-control-label">출발역</label></div>
    <div class="col-12 col-md-9"><input type="text"  name="dep_place${i}" readonly class="form-control" value="${}"></div>
    </div>
    <div class="row form-group">
    <div class="col col-md-3"><label for="dep_place${i}" class=" form-control-label">출발역</label></div>
    <div class="col-12 col-md-9"><input type="text"  name="dep_place${i}" readonly class="form-control" value="${}"></div>
    </div>
    </div>
    <div class="card-footer">
    <button type="submit" class="btn btn-primary btn-sm">
    <i class="fa fa-dot-circle-o"></i> Submit</button>
    <button type="reset" class="btn btn-danger btn-sm">
    <i class="fa fa-ban"></i> Reset</button>
    </div></form></div>
*/


//func2 full
async function searchRoute() {
  var depPlace = $("#departureStation").val();
  var arrPlace = $("#arriveStation").val();
  var depPlaceIdArr = await getStationCode(depPlace, cityCodes);
  var arrPlaceIdArr = await getStationCode(arrPlace, cityCodes);
  var depPlandTime = $("#date").val();
  var depPlaceId = null;
  var arrPlaceId = null;

  for (var i = 0; i < depPlaceIdArr.length; i++) {
    if (depPlaceIdArr[i] != undefined) {
      depPlaceId = depPlaceIdArr[i];
      break;
    }
  }

  for (var i = 0; i < arrPlaceIdArr.length; i++) {
    if (arrPlaceIdArr[i] != undefined) {
      arrPlaceId = arrPlaceIdArr[i];
      break;
    }
  }

  if (depPlaceId && arrPlaceId) {
    searchTrainLoute(depPlaceId, arrPlaceId, depPlandTime);
  } else {
    if (!depPlaceId) {
      console.error("출발역을 찾을 수 없습니다.");
    } else if (!arrPlaceId) {
      console.error("도착역을 찾을 수 없습니다.");
    } else {
      console.error("알 수 없는 에러가 생겼습니다.");
    }
  }
}

$("#submit").on("click", function () {
  searchRoute();
});


// func4 Search Template
function createForm(i, itemData){
  //csrf 호출
  var csrfToken = document.querySelector('meta[name="_csrf"]').getAttribute('content');
  var csrfHeaderName = document.querySelector('meta[name="_csrf_header"]').getAttribute('content');


  //form 담을 카드
  var card = $('<div/>',{
    'class': `card-${i}`,
    'style': 'margin-bottom: 30px'
  });

  //form
  var form = $('<form/>',{
    'action': '/admin/trainCreate',
    'method': 'post',
    'class': `form-horizontal form-${itemData.trainno}`
  });

  //_csrf
  var csrf = $('<input/>',{
    'type': 'hidden',
    'name': '_csrf',
    'value': csrfToken
  });

  //card-body
  var cardBody = $('<div/>',{
    'class': `card-body card-block cardBody-${itemData.trainno}`
  });


  //form-group 1
  var formGroup = $('<div/>',{'class': `row form-group formGroup-${itemData.trainno}`});

  //label div 1
  var labelDiv = $('<div/>',{'class': `col col-md-3 labelDiv-${itemData.trainno}`});

  //label 1
  var depPlaceLabel = $('<label/>',{
    'for': `dep_place`,
    'class': `form-control-label label-${itemData.trainno}`,
    'text': '출발역'
  });

  //input div 1
  var inputDiv = $('<div/>', {
    'class': `col-12 col-md-9 inputDiv-${itemData.trainno}`
  });

  //input 1
  var depPlaceInput = $('<input/>',{
    'type': 'text',
    'name': `dep_place`,
    'readonly': 'readonly',
    'class': `form-control input-${itemData.trainno}`,
    'value': itemData.depplacename
  });

  //                      dep_place end

  //form-group 2
  var formGroup2 = $('<div/>',{'class': `row form-group formGroup2-${itemData.trainno}`});

  //label div 2
  var labelDiv2 = $('<div/>',{'class': `col col-md-3 labelDiv2-${itemData.trainno}`});

  //label 2
  var depPlaceLabel2 = $('<label/>',{
    'for': `dep_time`,
    'class': `form-control-label label2-${itemData.trainno}`,
    'text': '출발 시간'
  });

  //input div 2
  var inputDiv2 = $('<div/>', {
    'class': `col-12 col-md-9 inputDiv2-${itemData.trainno}`
  });

  //input 2
  var depTimeInput2 = $('<input/>',{
    'type': 'text',
    'name': `dep_time`,
    'readonly': 'readonly',
    'class': `form-control input2-${itemData.trainno}`,
    'value': itemData.depplandtime
  });

  //                       dep_time end

  //form-group 3
  var formGroup3 = $('<div/>',{'class': `row form-group formGroup3-${itemData.trainno}`});

  //label div 3
  var labelDiv3 = $('<div/>',{'class': `col col-md-3 labelDiv3-${itemData.trainno}`});

  //label 3
  var depPlaceLabel3 = $('<label/>',{
    'for': `arr_place`,
    'class': `form-control-label label3-${itemData.trainno}`,
    'text': '도착역'
  });

  //input div 3
  var inputDiv3 = $('<div/>', {
    'class': `col-12 col-md-9 inputDiv3-${itemData.trainno}`
  });

  //input 3
  var depTimeInput3 = $('<input/>',{
    'type': 'text',
    'name': `arr_place`,
    'readonly': 'readonly',
    'class': `form-control input3-${itemData.trainno}`,
    'value': itemData.arrplacename
  });

  //                    arr_place end

  //form-group 4
  var formGroup4 = $('<div/>',{'class': `row form-group formGroup4-${itemData.trainno}`});

  //label div 4
  var labelDiv4 = $('<div/>',{'class': `col col-md-3 labelDiv4-${itemData.trainno}`});

  //label 4
  var depPlaceLabel4 = $('<label/>',{
    'for': `arr_time`,
    'class': `form-control-label label4-${itemData.trainno}`,
    'text': '도착 시간'
  });

  //input div 4
  var inputDiv4 = $('<div/>', {
    'class': `col-12 col-md-9 inputDiv4-${itemData.trainno}`
  });

  //input 4
  var depTimeInput4 = $('<input/>',{
    'type': 'text',
    'name': `arr_time`,
    'readonly': 'readonly',
    'class': `form-control input4-${itemData.trainno}`,
    'value': itemData.arrplandtime
  });

  //                              arr_time end

  //form-group 5
  var formGroup5 = $('<div/>',{'class': `row form-group formGroup5-${itemData.trainno}`});

  //label div 5
  var labelDiv5 = $('<div/>',{'class': `col col-md-3 labelDiv5-${itemData.trainno}`});

  //label 5
  var depPlaceLabel5 = $('<label/>',{
    'for': `grade`,
    'class': `form-control-label label5-${itemData.trainno}`,
    'text': '열차 종류'
  });

  //input div 5
  var inputDiv5 = $('<div/>', {
    'class': `col-12 col-md-9 inputDiv5-${itemData.trainno}`
  });

  //input 5
  var depTimeInput5 = $('<input/>',{
    'type': 'text',
    'name': `grade`,
    'readonly': 'readonly',
    'class': `form-control input5-${itemData.trainno}`,
    'value': itemData.traingradename
  });

  //card-footer
  var cardFooter = $('<div/>',{'class': 'card-footer'});

  //submit
  var submit = $('<button/>',{
    'type': 'submit',
    'class': 'btn btn-primary btn-sm',
    'text': '등록하기'
  });

  


  labelDiv.append(depPlaceLabel);
  formGroup.append(labelDiv);
  inputDiv.append(depPlaceInput);
  formGroup.append(inputDiv);

  labelDiv2.append(depPlaceLabel2);
  formGroup2.append(labelDiv2);
  inputDiv2.append(depTimeInput2);
  formGroup2.append(inputDiv2);

  labelDiv3.append(depPlaceLabel3);
  formGroup3.append(labelDiv3);
  inputDiv3.append(depTimeInput3);
  formGroup3.append(inputDiv3);

  labelDiv4.append(depPlaceLabel4);
  formGroup4.append(labelDiv4);
  inputDiv4.append(depTimeInput4);
  formGroup4.append(inputDiv4);

  labelDiv5.append(depPlaceLabel5);
  formGroup5.append(labelDiv5);
  inputDiv5.append(depTimeInput5);
  formGroup5.append(inputDiv5);


  cardFooter.append(submit);
  cardBody.append(formGroup, formGroup2, formGroup3, formGroup4, formGroup5);
  form.append(csrf).append(cardBody).append(cardFooter);
  card.append(form);
  $(".api-result").append(card);
}