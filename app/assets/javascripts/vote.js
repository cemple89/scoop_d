$(document).ready(function() {

  $('.js-upvote').on('click', function(event){
    event.preventDefault();

    var self = $(this),
        location = self.data('location'),
        review = self.data('review'),
        count = self.data('value'),
        user = self.data('user');
    var down_thumb = $("#js-downvote-" + review);

    var up_request = $.ajax({
      method: "POST",
      data: {review_id: review, location_id: location, count: count},
      URL: '/locations/`$(location)`/reviews/`$(review)`/vote'
    });

    console.log(down_thumb)
    console.log(self)

    up_request.done(function(data) {

      if (data === null) {
        down_thumb.removeClass('downvote')
        down_thumb.addClass('novote');
        self.removeClass('upvote');
      } else {
        down_thumb.removeClass('downvote')
        down_thumb.addClass('novote');
        self.addClass('upvote');
      }
    })
  });


  $('.js-downvote').on('click', function(event){
    event.preventDefault();
    var self = $(this),
        location = self.data('location'),
        review = self.data('review'),
        count = self.data('value'),
        user = self.data('user');
    var up_thumb = $('#js-upvote-'+review)

    var down_request = $.ajax({
      method: "POST",
      data: {review_id: review, location_id: location, count: count},
      URL: '/locations/`$(location)`/reviews/`$(review)`/vote'
    });

    down_request.done(function(data) {
      if (data === null) {
        up_thumb.css('color', 'black');
        self.css('color', 'black')
      } else {
        up_thumb.css('color', 'black');
        self.css('color', 'red')
      }
    })
  });

});
