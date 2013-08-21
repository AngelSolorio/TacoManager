TacoManager
===========

This is a Crowd Interactive training project

---
This README would normally document whatever steps are necessary to get the
application up and running.


## Dependencies
This application depends on Ruby 2.0 and Ruby on Rails 4.0

## Setup the project
---

1. Clone the project

        git clone https://github.com/AngelSolorio/TacoManager.git

2. Setup the database

    a) Posqtgresql database is being used in this application. To start with a clean database run:

        rake db:drop db:setup

    b) Run the database migrations with:

        rake db:migrate


## Set third party credentials
---

### Authentication
For authentication it uses OmniAuth with the providers: Github, GooglePlus, Facebook, Twitter, Linkedin and Identity. Before starting the application export the keys as follow:

    export GITHUB_KEY='client_id'
    export GUTHUB_SECRET='client_secret'
    
    export TWITTER_CONSUMER_KEY='client_id'
    export TWITTER_CONSUMER_SECRET='client_secret'

    export FACEBOOK_KEY='client_id'
    export FACEBOOK_SECRET='client_secret'
    
    export GPLUS_KEY='client_id'
    export GPLUS_SECRET='client_secret'
    
    export LINKEDIN_KEY='client_id'
    export LINKEDIN_SECRET='client_secret'

These keys are being used in the omniauth.rb initializer

### SMTP
For SMTP it uses ActionMailer with SendGrid Account. Before starting the application export SendGrid account keys as follow:

    export APP_DOMAIN='app_name_domain'
    export SENDGRID_USERNAME='sendgrid_username'
    export SENDGRID_PASSWORD='sendgrid_password'

These keys are being used in the smtp_setup.rb initializer


## Run tests
---

Minitest is used to test this app so all tests can been found in the /test directory. For integration tests minitest with capybara is being used.

To run the tests use the following rake tasks:

    rake test
    rake test:models
    rake test:controllers
    rake test:integration


## Start the server
---
Puma is the web server used for this application, so to start puma server with foreman run:

    foreman start

This command will start puma server on localhost at port 5000,
http://127.0.0.1:5000
