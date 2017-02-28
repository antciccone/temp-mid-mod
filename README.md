# Urlock Box

URLockbox is a app that allows a user to create an account and login using their email. The user is then allowed to add links to the index page and mark the links as read or unread. This app also renders an api of top read links.

## Getting Started

1. Clone the repository:
```shell
git clone git@github.com:antciccone/temp-mid-mod.git
git checkout final
```
2. Bundle application
```shell
  bundle install
```
3. Install PhantomJS
```shell
  npm install phantomjs -g
```

4. Create and migrate database
```shell
  rake db:create db:migrate
```

## Running the tests

The test suite is running on Poltergeist and RSpec in order test the rails backend with the client side JavaScript. Poltergeist is a driver for Capybara.

To run all tests, run in the terminal:
```shell
rspec
```

## Deployment

* Production: https://glacial-shelf-71817.herokuapp.com/

## Technology

The application is currently using the following technlogies:
* Server: Ruby On Rails 5.0.1
* Database: PostgreSQL
* Libraries: JQuery, Axios

## Authors

* [Anthony Ciccone](https://github.com/anticcone/)
