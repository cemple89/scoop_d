# README

![Build Status](https://codeship.com/projects/814f2f40-6ba7-0134-6c7a-6efe74dd2a57/status?branch=master)
![Code Climate](https://codeclimate.com/github/cemple89/scoop_d.png)
![Coverage Status](https://coveralls.io/repos/cemple89/scoop_d/badge.png)


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# scoopd
==========

Scoopd was created as a group project by Charlie Emple, Elizabeth de Moll, Sophie Heller, and Nathan Wright to satisfy curriculum requirements at Launch Academy. It is a review app focused on ice cream shops in the greater Boston area. We not only satisfied Launch's group project requirement, but we also created a tool to find the best ice cream Boston has to offer - and allow users to share their thoughts about this very important topic.

List of Features:
------------------
 - User log-in ability with Devise (ED & NW)
 - Ability to upload profile photos with CarrierWave (SH & NW)
 - Ability to search for specific ice cream shops (ED & SH)
 - Ability to write reviews for ice cream shops (CE & SH)
 - User receives an email when another user reviews the same store: (SH & CE)
 - The ability to upvote or downvote a review
 - Index page that live updates through React (ED & SH)
 - Creation of an admin role that handles user and review deletions (SH & ED)
 - Integration of ice cream shop images into show pages (CE & NW)



Outline of Technologies:
------------------------
- Ruby on Rails
- React: index page
- Ajax: index page and voting functionality
- POSTGRESQL
- ActiveRecord
- Foundation
- Capybara
- Factory Girl


Heroku link: https://still-cliffs-10828.herokuapp.com/ 

To Run Locally:
---------------------
1. Run rake db:migrate to acquire databases.
2. Run rake db:seed in order to populate the site with Boston area ice cream shops.
3. Make sure to bundle to install any Ruby dependencies.
4. Run npm install for any React dependencies.
