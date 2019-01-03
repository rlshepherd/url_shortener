# URL Shortener

[![Build Status](https://travis-ci.com/rlshepherd/url_shortener.svg?branch=master)](https://travis-ci.com/rlshepherd/url_shortener) [![codecov](https://codecov.io/gh/rlshepherd/url_shortener/branch/master/graph/badge.svg)](https://codecov.io/gh/rlshepherd/url_shortener)

This is a simple URL shortener service built using Ruby and sinatra. 

**[View the live demo here](https://fast-lake-48744.herokuapp.com/)**

## Installation and running locally

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

This project only includes the `mysql2` and `pg` gems in the Gemfile. If you want to use another database (such as sqlite), you will need make sure you have the corresponding gem installed.

Importantly, the database server must be running before you execute `rake db:setup`.

## Heroku Deployment

**On the command line:**

Run `checkout -b heroku` to create a new branch for deployment.

Add a `config/database.yml`:

```yml
production:
  adapter: postgresql
  encoding: unicode
  pool: 5
  host: <%= ENV['DATABASE_HOST'] %>
  database: <%= ENV['DATABASE_NAME'] %>
  username: <%= ENV['DATABASE_USER'] %>
  password: <%= ENV['DATABASE_PASSWORD'] %>
```

Add and commit to git.

Run `heroku create` to create the heroku app (requires heroku CLI).

**On Heroku**

Navigate to your apps dashboard.

Under resources, add a postgres database.

Under settings, add the various DATABASE environment variables needed in the database.yml. You can see the values in the `DATABASE_URL` environment variable.

Add a `SINATRA_ENV` environment variables with a value of `production`

**Deploy**

On the command line, run the equivalent of this command to push your local heroku branch to the heroku remote master brance:
`git push <remote> <local branch name>:<remote branch to push into>`

It is probably this: `git push heroku heroku:master`

Run your migrations `heroku run rake db:migrate` (`rake db:setup` will not work because heroku doesn't give you db creation permissions directly.)

Navigate to your app.




