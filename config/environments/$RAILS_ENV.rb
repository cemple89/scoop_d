# frozen_string_literal: true
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
  address: 'smtp.gmail.com',
  port: 587,
  domain: "http://localhost:3000",
  user_name: "scoopdmailer",
  password: "scoopdrocks",
  authentication: "plain",
  enable_starttls_auto: true
}
