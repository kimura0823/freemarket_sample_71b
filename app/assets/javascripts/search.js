$(document).on('turbolinks:load', function(){
  var list = $("#list");
  var searchWordList = $('.search_word_list').val();

  function appendList(word, number) {    
    let item = $(`
    <li class="list result-list">
      <a href = "/products/${number+1}" class="search-word-list">
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
        if (word.match(reg)) {
          appendList(word,i);
        }
        });
    };
  });

  $(".search_results_wrapper").on('click', function(){
    $(".search_results_wrapper").empty();
  });
});