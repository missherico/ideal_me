IDEAL ME
========

This web application is hand-crafted by do gooders: Eli, Spencer, Sylvie, and Isa.
----------------------------------------------------------------------------------

Ideal.ME will help you get to where you want to be.  You create an Ideal Chart and divide out the percentage of your time per day you would like to devote to each of the three categories: Social, Health, Intellect.  Then, create interests around those categories as reminders of what you would like to work on.  After those two are set, you get another chart, Real Chart, that is based on real activities.  As you input real activities your Real Chart grows and you can visualize your progress against your
Ideal Chart. 

## This app lives at: http://idealme.herokuapp.com

## Powered by:  
* Ruby (2.0) on Rails (4) 
* PostgreSQL 
* Redis 
* Amazon S3 
* Canvas.js 
* Bootstrap

## Gems we used:
* Devise
* Active Model Serializer
* Mandrill Mailer
* Gon
* Carrierwave, Fog, RMagic
* Sidekiq, Sidetiq, Unicorn
* Factory Girl Rails

### Dashboard Preview
![Alt text](assets/screenshots/dashboard.png "Dashboard Preview")

### Profile Page Preview
![Alt text](assets/screenshots/profile_page.png "Profile Page Preview")

## How to install
1. Fork this repository
2. Clone to your local machine 
3. Run bundler
4. Set up secret keys for:
  * SECRET_KEY_BASE
  * MANDRILL_APIKEY
  * AWS_ACCESS_KEY_ID
  * AWS_SECRET_ACCESS_KEY 
  * AWS_S3_BUCKET
5. Set UNICORN_WORKERS=2