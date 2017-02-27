var $newLinkTitle, $newLinkUrl;

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
  })
})
