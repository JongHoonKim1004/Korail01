/**
 * 
 */

//qnaModifyCheck
function qnaModifyCheck(){
  if(document.frm.title.value == ''){
    alert("제목을 입력해주세요");
    frm.title.focus();
    return false;
  }
  if(document.frm.content.value == ''){
    alert("질문을 입력해주세요");
    frm.content.focus();
    return false;
  }

  return true;
}

//qnaWriteCheck
function qnaWriteCheck(){
  if(document.frm.title.value == ''){
    alert("제목을 입력해주세요");
    frm.title.focus();
    return false;
  }
  if(document.frm.content.value == ''){
    alert("질문을 입력해주세요");
    frm.content.focus();
    return false;
  }

  return true;
}
