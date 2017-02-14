$( document ).ready(function(){
  $("body").on("click", ".mark-as-read", markAsRead)
})

function markAsRead(e) {
  e.preventDefault();
  axios.put('http://localhost:3000/api/v1/links/' + this.id)
  this.parentElement.parentElement.children[2].innerText = "true"
}
