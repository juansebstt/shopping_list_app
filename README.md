# README


SHOPPING LIST APP - SkydropX Developer Challenge


This README documents the steps necessary to get the Shopping List application up and running.

## Ruby version

```
This application is built using Ruby version 3.2.3.
```

## System dependencies

The application has the following system dependencies:

```
* Ruby (version 3.2.3)
* Rails (version 7.1.3)
* SQLite (version 3) for development and testing
```


## Configuration

No special configuration is required to run the application. However, you may need to install dependencies using Bundler:

```bash
bundle install
```

## Database creation

The SQLite database can be created by running the following Rails command:

```bash
rails db:create
```

## Database initialization

Once the database is created, you can run migrations to initialize the database schema:

```bash
rails db:migrate
```

## How to run the test suite

The application comes with a test suite written using RSpec. You can run the test suite using the following command:

```bash
rspec
```

## Services (job queues, cache servers, search engines, etc.)

The application does not require any additional services such as job queues, cache servers, or search engines.

## Deployment instructions

To deploy the application to a production environment, you can follow these general steps:

1. Set up a production database (e.g., PostgreSQL) and update the `config/database.yml` file accordingly.
2. Precompile assets for production:

```bash
rails assets:precompile RAILS_ENV=production
```

3. Configure any environment-specific settings in `config/environments/production.rb`.
4. Set up a production server (e.g., Heroku, AWS, DigitalOcean) and deploy the application according to the platform's documentation.

## Functionalities

The Shopping List application has the following functionalities:

* CRUD Operations: Users can create, read, update, and delete shopping list items.
* View Components: View Components gem is used to build different elements of the application's views.
* Turbo Stream: Turbo Stream is integrated to update the DOM dynamically when performing actions without full page reloads.
```

This formatted version uses:

* Headers (`#`) for different sections.
* Code blocks (````bash`) for commands.
* Bullet points (`-`) for lists.

This improves readability and makes the information in your README file easier to understand and follow.
