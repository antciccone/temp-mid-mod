$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();
  axios.put('https://boiling-beach-92219.herokuapp.com/api/v1/links/' + this.id)
  this.parentElement.parentElement.children[2].innerText = "true"
}
