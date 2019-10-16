document.addEventListener('turbolinks:load',function(){
  if ($("#token_submit").length){
    Payjp.setPublicKey("pk_test_f12cc94f427825310e4afc1c"); 
    var btn = document.getElementById("token_submit");
    btn.addEventListener("click", e => { 
      e.preventDefault();
      let card = {
        number: document.getElementById("card_number").value,
        cvc: document.getElementById("cvc").value,
        exp_month: document.getElementById("exp_month").value,
        exp_year: document.getElementById("exp_year").value
      }; 
      Payjp.createToken(card, (status, response) => {
        if (status === 200) { 
          $("#card_number").removeAttr("name");
          $("#cvc").removeAttr("name");
          $("#exp_month").removeAttr("name");
          $("#exp_year").removeAttr("name"); 
          $("#card_token").append(
            $('<input type="hidden" name="payjp-token">').val(response.id)
          ); 
          alert("登録が完了しました"); 
          $("#card_form").submit();
        } else {
          alert("カード情報が正しくありません。"); 
        }
      });
    });
  }
})
