FROM ruby:2.6-alpine

RUN apk update && \
    apk upgrade && \
    apk add --virtual build-dependencies && \
    apk add build-base

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
