FROM ruby:3.3.10-slim

WORKDIR /app

COPY update-laser-cutter.rb /app/update-laser-cutter.rb

ENTRYPOINT ["ruby", "/app/update-laser-cutter.rb"]
