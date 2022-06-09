# Marios Specialty Food Products

#### A Rails application that lists food products and reviews

## Technologies Used

* Ruby on Rails
* RSPEC
* pry
* Postgres
* PSQL
* capybara
* ActiveRecord

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

## Known Bugs

* There are no known bugs at this time
* Please forward any bugs to R.c@rt3%8*@ho***il.com

## License

* MIT https://en.wikipedia.org/wiki/MIT_License
* Copyright (c) 6/3/2022