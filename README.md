# README

![Build Status](https://codeship.com/projects/814f2f40-6ba7-0134-6c7a-6efe74dd2a57/status?branch=master)
![Code Climate](https://codeclimate.com/github/cemple89/scoop_d.png)
![Coverage Status](https://coveralls.io/repos/cemple89/scoop_d/badge.png)

# scoopd
==========

Application link: https://scoopd.herokuapp.com/

Scoopd was created as a group project by Charlie Emple, Elizabeth de Moll, Sophie Heller, and Nathan Wright to satisfy curriculum requirements at Launch Academy. It is a review app focused on ice cream shops in Boston, Cambridge, and Somerville. We not only satisfied Launch's group project requirement, but we also created a tool to find the best ice cream Boston has to offer - and allow users to share their thoughts about this very important topic.

List of Features:
------------------
 - User log-in ability with Devise (ED & NW)
 - Ability to upload profile photos with CarrierWave (SH & NW)
 - Ability to search for specific ice cream shops (ED & SH)
 - Ability to write reviews for ice cream shops (CE & SH)
 - User receives an email when another user reviews the same store (SH & CE)
 - The ability to upvote or downvote a review (ED & CE & NW)
 - Index page that live updates through React (ED & SH)
 - Creation of an admin role that handles user and review deletions (SH & ED)
 - Integration of ice cream shop images into show pages (CE & NW)


Outline of Technologies:
------------------------
- Ruby on Rails (2.3.1)
- React (index page)
- Ajax (index page and review upvote/downvote)
- PostgreSQL
- ActiveRecord
- Foundation & CSS
- Capybara
- Factory Girl


To Run Locally:
---------------------
1. Run rake db:migrate to acquire databases.
2. Run rake db:seed in order to populate the site with Boston area ice cream shops.
3. Make sure to bundle to install any Ruby dependencies.
4. Run npm install for any React dependencies.
5. Run rails server and webpack-dev-server simultaneously.
