$(document).on('turbolinks:load', function(){
  var list = $("#list");
  var searchWordList = $('.search_word_list').val();


  function appendList(word, number) {    
    let item = $(`
    <li class="list result-list">
      <a href = "/products/${number}" class="search-word-list">
        <p>${word}</p>
    `);
    // list.append(item);
    $("#result-word").append(item);
    // $("#result-word").text("");
    // $("#result-word").text(word);
  }

  function editElement(element) {
    let result = "^" + element;
    return result;
  }

  $("#search-box").on("keyup", function() {
    let input = $("#search-box").val();
    if (input==""){
      $("#result-word").empty();
    }else {
      let inputs = input.split(" ");
      let newInputs = inputs.map(editElement);
      let reg = RegExp(newInputs.join("|"));
      $(".list").remove();
  
      $.each( JSON.parse(searchWordList), function(i, word) {
        if (word.match(reg)) {
          // var number = searchWordList.indexOf();
          appendList(word,i);
        }
        });
    };
  });
});