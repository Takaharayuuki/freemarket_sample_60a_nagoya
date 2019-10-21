$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(category){
    var html = `<option value="${category.name}" data-category="${category.id}">${category.name}</option>`;
    return html;
  }

  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='y-select-wrap'>
                          <i class='fas fa-chevron-down'></i>
                          <select class="y-select-default" id="y-parent-form" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          </select>
                        </div>
                      </div>`;
    $('.y-sell-content__form-group').append(childSelectHtml);
  }

  $('#y-parent-form').on('change', function(){
    var parentCategory = document.getElementById('y-parent-form').value; //選択された親カテゴリーの名前を取得
    // if (parentCategory != "---"){ //親カテゴリーが初期値でないことを確認
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        data: { category: category }, //サーバーに送信する値
        dataType: 'json'
      })
      .done(function(children){
        // $('#children_wrapper').remove(); //親が変更された時、子以下を削除するする
        // $('#grandchildren_wrapper').remove();
        // $('#size_wrapper').remove();
        // $('#brand_wrapper').remove();
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        appendChidrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    // }else{
      // $('#children_wrapper').remove(); //親カテゴリーが初期値になった時、子以下を削除するする
      // $('#grandchildren_wrapper').remove();
      // $('#size_wrapper').remove();
      // $('#brand_wrapper').remove();
    // }
  });
})