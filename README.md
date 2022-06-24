# Marios Specialty Food Products

#### A Rails application that lists food products and reviews

## Technologies Used

* Ruby
* Rails
* RSPEC
* pry
* Postgres
* PSQL
* capybara
* ActiveRecord
* Faker
* Will_paginate
* Simplecov
* Devise
* HTML
* Shoulda-Matchers

## This application will allow a user to add, view, update, and delete products. It will also add, view, update, and delete reviews from a product.

## Setup and Installation Instructions
_This app was created with Ruby 2.6.9p207_

_Run the following commands in the Terminal:_

1. `$ git clone` [this repository](https://github.com/Rian-Carter/marios_food_codeReview.git)
2. `$ cd marios_food_code_review`
3. `$ bundle install`
4. `$ pg_ctl start` _to start up a psql server_
5. `$ rake db:create`
6. `$ rake db:test:prepare`
7. `$ rake db:migrate`
8. `$ rake db:seed`
9. `$ rspec` _to see passing tests._
10. `$ rails s` _to start up a rails server, then navigate to localhost:3000 in your browser._
11. _Create an account to view user piviledges._
12. _To become an admin, open the rails console by running `$ rails c` in your terminal_
13. _Locate your account by entering_ `User.where` _Here you will see your account_
14. _Once you locate your account, you will need to set your admin privileges to true_
15. _In the terminal run the command_ `User.where(email: "YOUR EMAIL HERE").update(admin: true)`
17. _Back in your web browser, navigate around the page to see all the admin privileges_

#### User

  ##### Credentials - email 'user@test.com' - password 'Testpassword123'
  1. A user can sign-up, sign-in, sign-out
  2. A user can view products.
  3. A user can view and add reviews to products.
  4. A user can see a product with the most reviews.
  5. A user can see the three most recently added products.
  6. A user who is not signed in will only be granted reading privileges.
  7. A user can edit their accout (reset password and cancel their account)

#### Admin

  ##### Credentials - email 'admin@test.com' - password 'Testpassword123'
  1. An admin can sign-up, sign-in, sign-out.
  2. An admin can view products.
  3. An admin can view product reviews.
  4. An admin can add, update, delete products.
  5. An admin can add, update, delete reviews from products.
  6. An admin can edit their account (reset password and cancel their account)

## Known Bugs

* There are no known bugs at this time
* Please forward any bugs to R.c@rt3%8*@ho***il.com

## License

* MIT https://en.wikipedia.org/wiki/MIT_License
* Copyright (c) 6/3/2022