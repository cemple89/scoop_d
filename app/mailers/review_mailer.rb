class ReviewMailer < ApplicationMailer
  default from: 'scoopdmailer@gmail.com'
  layout 'mailer'
  def review_email(user, review)
    @user = user
    @review = review
    mail(to: @user.email, subject: 'Review Email')
  end
end
