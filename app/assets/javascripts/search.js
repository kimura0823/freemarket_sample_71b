$(document).on('turbolinks:load', function(){
  var list = $("#list");
  var searchWordList = $('.search_word_list').val();
  var re_wrapper =$(".search_results_wrapper")

  function appendList(word, number) {    
    let item = $(`
    <li class="list result-list">
      <a href = "/products/${number}" class="search-word-list">
        <p>${word}</p>
    `);
    $("#result-word").append(item);
  }

  function editElement(element) {
    if (element != ""){
      let result = "^" + element;
      return result;
    }else{
      let result = "$^";
      return result;
    }
  }
  
  $("#_products_searches_keyword").on("keyup", function() {
    let input = $("#_products_searches_keyword").val();
    if (input==""){
      $("#result-word").empty();
    }else {
      let inputs = input.split(" ");
      let newInputs = inputs.map(editElement);
      let reg = RegExp(newInputs.join("|"));
      $(".list").remove();
      $.each( JSON.parse(searchWordList), function(i, word) {
        var searchIdList = $('.search_id_list').val();
        searchIdList =JSON.parse(searchIdList)
        if (word.match(reg)) {
          appendList(word,searchIdList[i]);
        }
        });
    };
  });
  $(re_wrapper).on('click', function(){
    $(re_wrapper).remove();
  });
});