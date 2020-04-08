# README
This project is the solution for this challenge:

https://github.com/iugu/account_movement_challenge

## Prerequisites

* Ruby 2.6.5
* Rails 6.0.1
* Postgresql database

## Installing

Clone the repository

- with ssh
```shell
git clone git@github.com:Roalves2606/account-movement-challenge.git
```
- with https
```shell
git clone https://github.com/Roalves2606/account-movement-challenge.git
```

Copy the environment variables
```shell
cd account-movement-challenge
cp .env.sample .env
```

#### Using Docker

Setup the project using docker-compose
```shell
docker-compose build
docker-compose up -d
```

Setup the project database
```shell
docker exec -it account-movement-challenge rails db:setup
```

Start the application

```shell
docker exec -it account-movement-challenge rails c
```

#### Without Docker

Assuming that you have installed RoR environment (you can do it following this [link](https://gorails.com/setup/ubuntu/19.10))

Install all dependencies

```shell
bundle install
```

Start the application

```shell
bundle exec rails c
```

## Running Application

####  First step
For this application to run properly, you need two csv files:
- One containing the account number and initial balance of each account. (separated by commas)
Ex.
![accounts csv example](/public/images/accounts_csv_example.png)

- One containing the account numbe and movement value. (also separated by commas)
Ex.
![transactions csv example](/public/images/transactions_csv_example.png)

You can also use the sample examples located at `public/documents/`
 - `public/documents/sample_accounts.csv`
 - `public/documents/sample_transactions.csv`

####  Second step
Start rails console

- with docker
```shell
docker exec -it account-movement-challenge rails c
```

 - without docker
```shell
bundle exec rails c
```
### Third step
Call the BankBalanceService, and pass the csv file paths as parameters.
```shel
BankBalanceService.call("accounts_file_path", "transactions_file_path")
```

The updated bank accounts balance should appear on the console.

## Running tests
```shell
docker exec -it account-movement-challenge bundle exec rspec
```
### Gem explanation
- **pg** => PostgreSQl is the database that i am most used to, and have the most experience.
- **pry** => I prefer pry over byebug, for cleaner debugging and with more options.
- **rubocop-performance** => Used to enforce best practices, performance wise, when coding.
- **rubocop-rails** => Used for enforce Rails best practices.
- **rubocop-rspec** => Used for enforce RSpec best practices.
- **rspec-rails** => Testing framework for rails
- **factory_bot_rails** => Used to automate object creation for tests.
- **faker** => Used to generate random data.
- **shoulda-matchers** => Used to simplify creation of some tests

- *All other gems were added by default*
### Thanks!
