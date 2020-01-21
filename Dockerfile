FROM ruby:2.6.5-alpine

ENV BUNDLER_VERSION=2.0.2

RUN apk add --update --no-cache \
      binutils-gold \
      build-base \
      curl \
      file \
      g++ \
      gcc \
      git \
      less \
      libstdc++ \
      libffi-dev \
      libc-dev \ 
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      libgcrypt-dev \
      make \
      netcat-openbsd \
      nodejs \
      openssl \
      pkgconfig \
      postgresql-dev \
      python \
      tzdata \
      graphicsmagick \
      yarn && \
    gem install bundler -v $BUNDLER_VERSION

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle config build.nokogiri --use-system-libraries
RUN bundle check || bundle install --without development test

COPY package.json yarn.lock ./
RUN yarn install --check-files

ARG RAILS_MASTER_KEY
ENV RAILS_ENV=production NODE_ENV=production RAILS_SERVE_STATIC_FILES=1 RAILS_LOG_TO_STDOUT=1

ADD . /app/
RUN bundle exec rake assets:precompile DISABLE_SPRING=1 && \
          chown -R nobody:nogroup /app

CMD ["bundle", "exec", "rails s -p 3000 -b 0.0.0.0"]
