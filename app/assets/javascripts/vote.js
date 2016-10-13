$(document).ready(function() {

  $('.js-upvote').on('click', function(event){
    event.preventDefault();

    var self = $(this),
        location = self.data('location'),
        review = self.data('review'),
        count = self.data('value'),
        user = self.data('user');

    var vote_total = $("#review-count-" + review);
    var vote_sprinkles = $("#sprinkles-" + review);
    var vote_total_num = parseInt(vote_total.html(), 10);

    var up_request = $.ajax({
      method: "POST",
      data: {review_id: review, location_id: location, count: count},
      URL: '/locations/`$(location)`/reviews/`$(review)`/vote'
    });

    up_request.done(function(data) {
      if (data === null) {
        vote_total.html(vote_total_num -= 1);
        var x =$("<i class='fa fa-times removed'></i>");
        $(vote_sprinkles).append(x);
        x.slideDown(250).delay(2000).slideUp(250);
      } else {
        vote_total.html(vote_total_num += 1);
        var x =$("<i class='fa fa-cloud-upload added'></i>");
        $(vote_sprinkles).append(x);
        x.slideDown(250).delay(2000).slideUp(250);
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
        var vote_total = $("#review-count-" + review);
        var vote_total_num = parseInt(vote_total.html(), 10);
    var vote_sprinkles = $("#sprinkles-" + review);

    var down_request = $.ajax({
      method: "POST",
      data: {review_id: review, location_id: location, count: count},
      URL: '/locations/`$(location)`/reviews/`$(review)`/vote'
    });

    down_request.done(function(data) {
      if (data === null) {
        vote_total.html(vote_total_num += 1);
        var y =$("<i class='fa fa-times removed'></i>");
        $(vote_sprinkles).append(y);
        y.slideDown(250).delay(2000).slideUp(250);
      } else {
        vote_total.html(vote_total_num -= 1);
        var y =$("<i class='fa fa-cloud-download downvoted'></i>");
        $(vote_sprinkles).append(y);
        y.slideDown(250).delay(2000).slideUp(250);
      }
    })
  });

});
