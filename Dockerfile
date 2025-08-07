FROM redmine:latest

USER root
RUN apt-get update && apt-get install -y --no-install-recommends build-essential && \
    rm -rf /var/lib/apt/lists/*

COPY extra_files/Gemfile.local /usr/src/redmine/Gemfile.local
COPY extra_files/additional_environment.rb /usr/src/redmine/config/additional_environment.rb
COPY extra_files/puma.rb /usr/src/redmine/config/puma.rb
COPY extra_files/sidekiq.rake /usr/src/redmine/lib/tasks/sidekiq.rake
COPY extra_files/sidekiq.rb /usr/src/redmine/config/initializers/sidekiq.rb

USER redmine
