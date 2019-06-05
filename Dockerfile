FROM ruby:2.4.0-alpine

RUN apk update && apk upgrade

WORKDIR /app
COPY Gemfile .
RUN bundle install && bundle clean
COPY . /app

ARG PORT=80
ENV PORT $PORT
EXPOSE $PORT

CMD ["ruby", "markdown-tree.rb"]