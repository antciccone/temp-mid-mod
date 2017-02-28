
function setAsRead() {
    var buttons = $('button')
    for (var i = 0; i < buttons.length; i++) {
      if (buttons[i].parentElement.children[2].innerHTML.trim() == "true") {
        buttons[i].innerHTML = 'Mark as Unread'
        $(buttons[i]).parent().children().first().css("text-decoration", "line-through")
      }
    }
}

$(document).ready(function(){
  setAsRead()

  $("body").on("click", ".read", function(){
     var linkId = this.id
     debugger;
     if (this.parentElement.children[2].innerHTML.trim() == "true") {
       this.parentElement.children[2].innerHTML = "false"
       this.innerHTML = "Mark as Read"
       $(this).parent().children().first().css("text-decoration", "none")

       $.ajax({
         url: '/api/v1/links/' + linkId,
         method: 'PATCH',
         data: {read: false}
       });
     } else {
       this.parentElement.children[2].innerHTML = "true"
       $(this).parent().children().first().css("text-decoration", "line-through")
       this.innerHTML = "Mark as Unread"

       $.ajax({
         url: '/api/v1/links/' + linkId,
         method: 'PATCH',
         data: {read: true}
       });
     }
  })

  $("#myInput").on('keyup', function() {
    var filter = this.value.toUpperCase();
    var search = $('.hot-read')
    for (i = 0; i < search.length; i++) {
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

  $("body").on("click", ".filter-by-read", function(){
    if (this.id == "show-all-read") {
      $('#false.hot-read').hide()
      $('#true.hot-read').show()
    } else if (this.id == 'show-all-unread'){
      $('#true.hot-read').hide()
      $('#false.hot-read').show()
    } else {
      $('#false.hot-read').show()
      $('#true.hot-read').show()
    }
  })
})
