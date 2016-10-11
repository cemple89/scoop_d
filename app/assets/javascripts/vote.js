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

    up_request.done(function(data) {
      self.css('color', 'green')
    })
  });


  $('.js-downvote').on('click', function(event){
    event.preventDefault();
    var self = $(this),
        location = self.data('location'),
        review = self.data('review'),
        count = self.data('value'),
        user = self.data('user');

    var down_request = $.ajax({
      method: "POST",
      data: {review_id: review, location_id: location, count: count},
      URL: '/locations/`$(location)`/reviews/`$(review)`/vote'
    });

    down_request.done(function(data) {
      self.css('color', 'red')
    })
  });

});
