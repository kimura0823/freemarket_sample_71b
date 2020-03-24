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
    
    
    
    <select name="product[burden_id]" id="delivery-way">
      ${insertHTML}
    </select>`;
    
    $('.delivery-burden').append(deliverywayHtml);
    
    
  }
 
  $(document).on('change', '#product_burden_id', function(){
    var deliveryway = document.getElementById('product_burden_id').value; 
    if (deliveryway != "選択してください"){ 
        if (deliveryway == "送料込み（出品者負担）") {
          $.ajax({
            url: 'get_deliverywayonSeller',
            type: 'GET',
            data: { deliveryway: deliveryway },
            dataType: 'json'
          })
          .done(function(onsellers){
            console.log(onsellers)
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
        if (deliveryway == "着払い（購入者負担）") {
          $.ajax({
            url: 'get_deliverywayonBuyer',
            type: 'GET',
            data: { deliveryway: deliveryway },
            dataType: 'json'
          })
          .done(function(onsellers){
            console.log(onsellers)
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