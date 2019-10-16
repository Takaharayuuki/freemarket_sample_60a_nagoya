// プレビューに挿入するHTMLの作成
function buildImage(loadedImageUri){
  var html =
  `<li>
    <img src=${loadedImageUri}>
    <div class="item__images__container__preview__box">
      <div class="item__images__container__preview__box__edit" >
        編集
      </div>
      <div>
        <a class="item__images__container__preview__box__delete">削除</a>
      </div>
    </div>
  </li>`
  return html
};
// 画像を管理するための配列を定義する。
var files_array = [];
// 通常のドラッグオーバイベントを止める。
$('.y-sell-container__file-area').on('dragover',function(e){
    e.preventDefault();
});
// ドロップ時のイベントの作成
$('.y-sell-container__file-area').on('drop',function(event){
  event.preventDefault();
    // 何故か、dataTransferがうまくいかなかったので、originalEventから読み込んでいます。
    // ここで、イベントによって得たファイルを配列で取り込んでいます。
  files = event.originalEvent.dataTransfer.files;
    // 画像のファイルを一つづつ、先ほどの画像管理用の配列に追加する。
  for (var i=0; i<files.length; i++) {
    files_array.push(files[i]);
    var fileReader = new FileReader();
    // ファイルが読み込まれた際に、行う動作を定義する。
    fileReader.onload = function( event ) {
    // 画像のurlを取得します。
    var loadedImageUri = event.target.result;
    // 取得したURLを利用して、ビューにHTMLを挿入する。
    $(buildImage(loadedImageUri,)).appendTo(".item__images__container__preview ul").trigger("create");
    };
    // ファイルの読み込みを行う。
    fileReader.readAsDataURL(files[i]);
  }
});