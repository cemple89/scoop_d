$(document).ready(function() {

  $('.js-upvote').on('click', function(event){
    event.preventDefault();

    var self = $(this),
        location = self.data('location'),
        review = self.data('review'),
        count = self.data('value'),
        user = self.data('user');

    var up_request = $.ajax({
      method: "POST",
      data: {review_id: review, location_id: location, count: count},
      URL: '/locations/`$(location)`/reviews/`$(review)`/vote'
    });

    // up_request.done(function(data) {
    //   // what goes here?!?!?!?
    // })
  });


  // $('.js-downvote').on('click', function(event){
  //   event.preventDefault();
  //   var self = $(this),
  //       review = self.data('review'),
  //       count = self.data('value'),
  //       user = self.data('user');
  //
  //   console.log(review)
  //   console.log(user)
  //   console.log(count)
  //   console.log("test data")
  //
  //   var down_request = $.ajax({
  //     method: "POST",
  //     URL: '/location/review$(id)/downvote'
  //   });
  //
  //   down_request.done(function(data) {
  //     // what goes here?!?!?!?
  //   })
  // });

});
