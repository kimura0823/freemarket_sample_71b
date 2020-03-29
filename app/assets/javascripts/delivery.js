$(function(){
  // カテゴリーセレクトボックスのオプションを作成
  function appendOption(deliveryway){
    var html = `<option value="${deliveryway.id}" data-category="${deliveryway.id}">${deliveryway.name}</option>`;
    return html;
  }
  // 子カテゴリーの表示作成
  function appendChidrenBox(insertHTML){
    var deliverywayHtml = '';
    deliverywayHtml = `
<br>
    <div class="category-group__title deliveryway-margin">
      <div class="text">
        配送の方法
      </div>
      <div class="text-caution">
        必須
      </div>
      <div class = "error-messages", id ="error-way"></div>
    </div>
    <div class="category-group__small-contents">
      <select name="product[deliveryway_id]" id="delivery-way_id">
        ${insertHTML}
      </select>
    </div>  
    `;
    
    $('.delivery-burden').append(deliverywayHtml);
    
    
  }
 
  $(document).on('change', '#product_burden_id', function(){
    var deliveryway = document.getElementById('product_burden_id').value; 
    if (deliveryway != "1"){ 
        if (deliveryway == "2") {
          $.ajax({
            url: 'get_deliverywayonSeller',
            type: 'GET',
            data: { deliveryway: deliveryway },
            dataType: 'json'
          })
          .done(function(onsellers){
            $('#delivery-way').remove(); 
            var insertHTML = '';
            onsellers.forEach(function(onseller){
              insertHTML += appendOption(onseller);
            });
            appendChidrenBox(insertHTML);
          })
          .fail(function(){
            alert('カテゴリー取得に失敗しました');
          })
        }
        if (deliveryway == "3") {
          $.ajax({
            url: 'get_deliverywayonBuyer',
            type: 'GET',
            data: { deliveryway: deliveryway },
            dataType: 'json'
          })
          .done(function(onsellers){
            $('#delivery-way').remove(); 
            var insertHTML = '';
            onsellers.forEach(function(onseller){
              insertHTML += appendOption(onseller);
            });
            appendChidrenBox(insertHTML);
          })
          .fail(function(){
            alert('カテゴリー取得に失敗しました');
          })
        }
     
    }else{
      $('#delivery-way').remove(); 
    };
  
  });
 
});