/**
 * 
 */

// 로그인 시도시 input 입력 됫는지 확인
function loginCheck(){
  if(document.frm.username.value == ''){
    alert("아이디를 입력하세요.");
    frm.username.focus();
    return false;
  }
  if(document.frm.password.value == ''){
    alert("비밀번호를 입력하세요.");
    frm.password.focus();
    return false;
  }

  return true;
}

// 회원가입 버튼 클릭시 필수부분 채움 확인 및 약관 동의 체크
function registerCheck(){
  if(document.frm.id.value == "") {
    alert("아이디를 입력해주세요");
    frm.id.focus();
    return false;
  }
  if(document.frm.reid.value == ""){
    alert("중복확인을 해주세요");
    frm.id.focus();
    return false;
  }
  if(document.frm.name.value == ""){
    alert("이름을 입력하세요");
    frm.name.focus();
    return false;
  }
  if(document.frm.password.value == ""){
    alert("비밀번호를 입력하세요");
    frm.password.focus();
    return false;
  }
  if(document.frm.password_check.value != document.frm.password.value){
    alert("비밀번호가 일치하지 않습니다.");
    frm.password.focus();
    return false;
  }
  if(!document.frm.iAgree.checked){
    alert("약관에 동의해주세요");
    frm.iAgree.forus();
    return false;
  }

  return true;
}

function idCheck(){
  if(document.frm.id.value == ''){
    alert("아이디를 입력해주세요");
    frm.id.focus();
    return;
  }

  var url = "/users/idCheck?id=" + document.frm.id.value;
  window.open(url, "_blank_1", "width=600px, height=400px, scrollbars=no, toolbar=no, menubar=no");
}

function idok(){
  opener.frm.id.value = document.frm.id.value;
  opener.frm.reid.value = document.frm.id.value;
  self.close();
}

