$(document).ready(function() {

  $('.fa-thumbs-o-up').on('click', 'a', function(event){
    event.preventDefault();

    $.ajax({
      method: "POST",
      URL: '/location/review$(id)/upvote'
    });

    request.done(function(data) {
      // what goes here?!?!?!?
    })
  });


  $('.fa-thumbs-o-down').on('click', 'a', function(event){
    event.preventDefault();
    // we also know stuff goes here

    $.ajax({
      method: "POST",
      URL: '/location/review$(id)/downvote'
    });

    request.done(function(data) {
      // what goes here?!?!?!?
    })
  });

});
