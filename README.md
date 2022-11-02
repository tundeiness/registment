# README

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
bin/rails generate migration AddServiceDateToEquipment service_date:date
bin/rails generate migration AddLoanStatusToEquipment loan_status:string
rails g model Request user:references equipment:references serial_no:string
