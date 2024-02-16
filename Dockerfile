FROM ruby:3.3.0-alpine

RUN adduser -D -u 1000 app

RUN apk add --no-cache \
    chromium \
    chromium-chromedriver \
    build-base \
    && rm -rf /var/cache/apk/*

ENV PATH="/usr/lib/chromium:$PATH"
ENV CHROME_DRIVER_PATH="/usr/lib/chromium/chromedriver"

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./

RUN bundle install

COPY . .

RUN chown -R app:app /usr/src/app

USER app

ENTRYPOINT ["cucumber", "-p", "no_report", "-p", "headless", "-p", "container_chrome", "--retry", "2", "--publish"]