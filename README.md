# Makers Week 3 - Battle Challenge #
## Summary ##

A battle game written in Ruby and Javascript that users can interact with via a browser.

Originally this was a multi-page app using Ruby and Sinatra. To improve the user experience, after completing Makers I decided to turn the battle phase into a single-page app. jQuery was used to change the page as the battle progressed, make API calls to the backend, and add battle attack images. 

## Setup ##

First, clone this repository. Then:

```bash
> bundle install

> bundle exec rspec #to run unit and feature tests (run in Firefox)
> rackup #to interact with program on localhost:9292
```
#### Gemfile ####
```ruby
ruby '2.6.3'

gem 'sinatra'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'puma'
end
```


## Core Requirements ##
* A user can inflict damage on an opponent
* A user can take damage a lose hitpoints
* A user can lose the battle upon losing all their hitpoints
* A user can play either another user or a computer opponent

#### Edge Cases ####

* Refresh edge case - refreshing the page would allow user access to the move selector div during the computer's turn. Current implementation avoids this by restarting the game on a page refresh. Could update jQuery to make sure the correct containers are displayed on hidden on refresh depending on the status of the game in the backend.

## Tests ##

#### Technologies ###

23 tests in total:

RSpec - unit tests written for each class, and dependency injection used to ensure isolation of classes when testing.

Capybara - features tests for battle features.


## Challenges / Future Development ##
