$(document).on('turbolinks:load', function(){
  $(function() {
    var dropzone = $('.dropzone-area');
    var images = [];
    var inputs  =[];
    var input_area = $('.input_area');
    var preview = $('#preview');

    // ファイルの読み込みとプレビュー画像の生成
    $(document).on('change', 'input[type= "file"].upload-image',function(event) {
      var file = $(this).prop('files')[0];
      var reader = new FileReader();
      inputs.push($(this));
      var img = $(`<div class= "img_view"><img class="preview" width="114px" height="114px"></div>`);
      reader.onload = function(e) {
        var btn_edit_wrapper = $('<div class="btn_wrapper"><div class="edit">編集</div></div>');
        var btn_delete_wrapper = $('<div class="btn_wrapper"><div class="delete">削除</div></div>');
        img.append(btn_edit_wrapper);
        img.append(btn_delete_wrapper);
        img.find('img').attr({
          src: e.target.result
        })
      }
      reader.readAsDataURL(file);
      images.push(img);

      if(images.length <= 5){
          $('#preview').empty();
          $.each(images, function(index, image) {
            image.attr('data-image', index);
            preview.append(image);
          })
          dropzone.css({
            'width': `calc(100% - (114px * ${images.length}))`
          })
        if(images.length == 5) {
          dropzone.css({
            'display': 'none'
          })
          return;
        }
      var new_image = $(`<input multiple= "multiple" name="item[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
      input_area.prepend(new_image);
    }
  });

    // 削除動作
    $(document).on('click', '.delete', function() {
      var target_image = $(this).parent().parent();
      $.each(inputs, function(index, input){
        if ($(this).data('image') == target_image.data('image')){
          $(this).remove();
          target_image.remove();
          var num = $(this).data('image');
          images.splice(num, 1);
          inputs.splice(num, 1);
          if(inputs.length == 0) {
            $('input[type= "file"].upload-image').attr({
              'data-image': 0
            })
          }
        }
      })
      $('input[type= "file"].upload-image:first').attr({
        'data-image': inputs.length
      })
      $.each(inputs, function(index, input) {
        var input = $(this)
        input.attr({
          'data-image': index
        })
        $('input[type= "file"].upload-image:first').after(input)
      })
     
      if (images.length <= 5){
        dropzone.css({
          'display': 'inline-block'
        })
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        dropzone.css({
          'width': `calc(100% - (114px * ${images.length}))`
        })
      }
      // 画像フォームを再度触れるようにする
      $(`input[data-image= "${images.length}"]`).css({
        'display': `none`
      })
    })
  });
});