/**
 * 
 */


// noticeWrite, noticeModify 글 작성 확인
function adminBoardCheck(){
  if(document.frm.title.value == ""){
    alert("제목을 입력하세요");
    frm.title.focus();
    return false;
  }
  if(document.frm.content.value == ""){
    alert("내용을 입력하세요");
    frm.content.focus();
    return false;
  }

  return true;
}

//adminDeleteCheck
function adminDeleteCheck(){
  if(confirm("정말로 삭제하시겠습니까?")){
    return true;
  }

  return false;
}

//adminRegisterCheck
function adminRegisterCheck(){
  if(document.frm.id.value == ''){
    alert("아이디를 입력해주세요");
    frm.id.focus();
    return false;
  }
  if(document.frm.password.value == ''){
    alert("비밀번호를 입력해주세요.");
    frm.password.focus();
    return false;
  }
  if(document.frm.phone.value == ''){
    alert("전화번호를 입력해주세요");
    frm.phone.focus();
    return false;
  }
  if(document.frm.email.value == ''){
    alert("이메일을 입력해주세요.");
    frm.email.focus();
    return false;
  }

  return true;
}
