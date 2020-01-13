# GitXplore

A platform that allows you to search for public repositories.


### Requirements
1. Ruby version 2.6.0
2. Rails 5.2.4
3. Bundler version 1.17.2


### Technology used
* Language
  1. Ruby
* Framework used
  1. Ruby on Rails
* Development and testing
  1. RSpec Rails
  2. Rubocop

### Setting up
1. clone this respository `git clone git@github.com:tomily1/gitxplore.git`.
2. Open the cloned directory with `cd gitxplore`.
3. Run `bundle install` to install dependencies

4. run server with `rails server`

## Approach

After reading the requirements for searching public repositories on Github's V3 api documentation, I created a very simple web app where I display public repositories from github based on search term provided by user. I added caching based on the search parameter which expires in 3 minutes to avoid hitting the api for same search keywords multiple times.

### Author

[Tomilayo Israel](https://github.com/tomily1)
