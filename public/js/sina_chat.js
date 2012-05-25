$(document).ready(function(){

  $("input").keyup( function () {
    if($("#textMessage").val() == ""){
      $("#btnSend").html("<i class='icon-refresh icon-white'></i>&#10;更新");
    }
    else{
      $("#btnSend").html("<i class='icon-share-alt icon-white'></i>&#10;送信");
    }
  }); 

  $("#btnSend").click(function(){
    document.formSendMsg.submit();
  });

});