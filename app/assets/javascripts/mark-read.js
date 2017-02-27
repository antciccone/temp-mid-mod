var $newLinkTitle, $newLinkUrl;

$(document).ready(function(){
  $("body").on("click", ".read", function(){
    this.parentElement.children[2].innerHTML = "read: true"
    var linkId = this.id
  

    $.ajax({
      url: '/api/v1/links/' + linkId,
      method: 'PATCH',
      data: {read: true}
    });
  })
})
