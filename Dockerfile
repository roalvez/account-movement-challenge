FROM ruby:2.6.5

RUN apt-get update -qq && apt-get install -y build-essential

RUN apt-get install -y libpq-dev

ENV RAILS_ENV development

RUN mkdir /account-movement-challenge
WORKDIR /account-movement-challenge

COPY Gemfile /account-movement-challenge/Gemfile
COPY Gemfile.lock /account-movement-challenge/Gemfile.lock

RUN bundle install

COPY . /account-movement-challenge
