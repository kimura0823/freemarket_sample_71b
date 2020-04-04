$(document).on('turbolinks:load', function(){
  var list = $("#list");
  var searchWordList = $('.search_word_list').val();


  function appendList(word, number) {
    // console.log(word);
    

    let item = $(`
    <li class="list result-list">
      <a href = "/products/${number}" class="search-word-list">
        <p>${word}</p>
    
    
    
    `);
    // list.append(item);
    // console.log(word);
    $("#result-word").append(item);
    // $("#result-word").text("");
    // $("#result-word").text(word);
  }

  function editElement(element) {
    let result = "^" + element;
    return result;
  }

  $("#search-box").on("keyup", function() {
    // console.log("ok")
    let input = $("#search-box").val();
    if (input==""){
      $("#result-word").empty();
    }else {
      
      let inputs = input.split(" ");
      // console.log(inputs);
      let newInputs = inputs.map(editElement);
      let reg = RegExp(newInputs.join("|"));
      // console.log(reg);
      $(".list").remove();
  
      $.each( JSON.parse(searchWordList), function(i, word) {
        // console.log(JSON.parse(searchWordList));
        if (word.match(reg)) {
          // var number = searchWordList.indexOf();
          appendList(word,i);
          // console.log(i);

        }
        });
    };



  });
});