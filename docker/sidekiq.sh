#!/bin/sh
bundle exec sidekiq -d -L "log/sidekiq.log" -e production -C config/sidekiq.yml
