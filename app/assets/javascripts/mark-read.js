// var $newLinkTitle, $newLinkUrl;

// function hotreads(linkURL) {
//   $.ajax({
//     url: 'http://localhost:8080/links',
//     method: 'POST'
//   });


function markHot() {

  var allLinks = $('.url-link').slice(0,9)

  for (var i = 0; i < allLinks.length; i++) {
    if ([i] == 0 )  {
      allLinks[i].parentElement.append("Hottest Link")
    } else {
      allLinks[i].parentElement.append("Hot Link")
    }
  }
}

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

    // hotreads()
  })

  markHot()
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

})
