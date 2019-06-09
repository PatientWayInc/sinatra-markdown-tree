FROM ruby:2.4.0-alpine

RUN apk update && apk upgrade

WORKDIR /app
COPY Gemfile .
RUN bundle install && bundle clean
COPY . /app

ARG PORT=80
ENV PORT $PORT
EXPOSE $PORT

ARG APP_ENV=production
ENV APP_ENV $APP_ENV

CMD ["ruby", "markdown-tree.rb"]
