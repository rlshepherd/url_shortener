# URL Shortener

[![Build Status](https://travis-ci.com/rlshepherd/url_shortener.svg?branch=master)](https://travis-ci.com/rlshepherd/url_shortener) [![codecov](https://codecov.io/gh/rlshepherd/url_shortener/branch/master/graph/badge.svg)](https://codecov.io/gh/rlshepherd/url_shortener)

This is a simple URL shortener service built using Ruby and sinatra. 

## Installing

1. Make sure you have the prequisites (see Prerequisites below).
2. Clone this repository.
3. Run `bundle install` from inside the project directory.
4. Configure your database (see Configuring Your Database below).
5. Run `rake db:setup` to create your database. If you get errors, see step 4.
6. Run the tests by running `rspec` or `rspec -I . spec/app_spec.rb` *(Optional)*
7. Run `shotgun` and navigate to the address output in the terminal.

## Prequisites

Ruby, at least version 2.2.

Bundler. You can install via `sudo gem install bundler`.

A running relational database server such as sqlite, mysql, or postgres.

## Configuring Your Database

You will need to tell the application how to interface with your database. You can specify this information in `config/database.yml`

Here is a sample `database.yml`:

```yml
default: &default
  adapter: mysql2

development: 
  <<: *default
  database: url_shortener_development
  host: localhost 
  username: root
  password: yourpassword
```

This project only includes the `mysql2` gem in the Gemfile. If you want to use another database (such as sqlite or postgres), you will need make sure you have the corresponding gem installed.

Importantly, the database server must be running before you execute `rake db:setup`.


