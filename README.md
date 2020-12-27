# README

This is a simple project that loads a csv of contacts and show the information and logs of the resulting loads.

##Ruby and Rails versions to run the project

- ruby 2.6.3
- rails 6.0.3.4

## Setup the database

1. Create the user and database in PostgreSQL to run locally:

- user:     contact_importer_user
- database: contact_importer_development
- password: contact_importer_development_password

2. Execute the command `rake db:migrate`

3. Execute the command `rake db:seed` to save the franchises of credit cards

## Run the project locally

1. Install nvm to install node version `v12.4.0`. After this use yarn to install dependencies
2. Install all the dependencies of the project with the command `yarn install`
3. Execute `bundle install` to install all the gems of the project
4. Install and run locally redis server following this tutorial https://www.digitalocean.com/community/tutorials/como-instalar-y-proteger-redis-en-ubuntu-18-04-es
5. You would need now three consoles to execute the project
    - `rails s` to run the server in backend
    - `redis-server` as a requirement to run Sideqik
    - `bundle exec sidekiq` to run background jobs of this project

# Use the platform

1. Create a user in Sign up section with an email and password with more than 6 characters, no confirmation required, you can use any email
2. You will be redirected to the instructions page, read carefully to use well the loader
3. Enjoy and test the loader