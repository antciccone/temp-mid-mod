var $newLinkTitle, $newLinkUrl;

function hotreads(linkURL) {
  axios.post('http://localhost:8080/api/v1/links', {
    url: "hi",
  })
  .then(function(response){
    console.log(response)
  })
  .catch(function(error){
    console.log(error)
  })
}

function markHot() {
  $('.url-link')[0].parentElement.append("Hottest Read")
  $('.url-link')[1].parentElement.append("Hot Link")

}

$(document).ready(function(){
  $("body").on("click", ".read", function(){
    this.parentElement.children[2].innerHTML = "read: true"
    var linkId = this.id
    $(this).parent().children().first().css("text-decoration", "line-through")

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    });

    hotreads()
  })

  markHot()
  $("#myInput").on('keyup', function() {
    debugger;
    var filter = this.value.toUpperCase();
    var search = $('.hot-read')
    for (i = 0; i < search.length; i++) {
      debugger;
     td = search[i].getElementsByClassName('url-link')[0]
     if (td) {
       if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
         search[i].style.display = "";
       } else {
         search[i].style.display = "none";
       }
     }
   }
  });
})
