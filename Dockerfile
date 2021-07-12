FROM ruby:3.0 AS base

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR /opt/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

FROM base AS test

CMD ["rake", "test"]
