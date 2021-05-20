/*chkSubmit(유효성 체크 대상, 메시지 내용)*/
function chkSubmit(v_item, v_msg){
   if(v_item.val().replace(/\s/g,"") == "" ){
      alert(v_msg + "을/를 입력해주세요" );
      v_item.val("");
      v_item.focus();
      return false;
   }else{
      return true;
   }
}

/* 함수명: chkData(유효성 체크 대상, 메시지 내용)
 * 출력영역: alert으로
 * 예시: if(!chkData("#keyword", "검색이름")) return;
 * */
function chkData(item, msg){
   if($(item).val().replace(/\s/g,"")=="") {
      alert(msg+" 입력해 주세요.");
      $(item).val("");
      $(item).focus();
      return false;
   } else {
      return true;
   }
}   