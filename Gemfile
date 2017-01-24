source "https://rubygems.org"

ruby "2.3.1"

gem "airbrake"
gem "autoprefixer-rails"
gem "bourbon", "~> 4.2.3"
gem "coffee-rails", "~> 4.1.0"
gem "delayed_job_active_record"
gem "dotfiles"
gem "email_validator"
gem "faraday"
gem "faraday_middleware"
gem "feedjira"
gem "flutie"
gem "high_voltage"
gem "i18n-tasks"
gem "jquery-rails"
gem "monban"
gem "monban-generators"
gem "neat", "~> 1.7.0"
gem "newrelic_rpm", ">= 3.9.8"
gem "normalize-rails", "~> 3.0.0"
gem "pg"
gem "rails", "4.2.7.1"
gem "recipient_interceptor"
gem "refills"
gem "sass-rails", "~> 5.0"
gem "simple_form"
gem "title"
gem "uglifier"
gem "unicorn"

group :development do
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", require: false
  gem "byebug"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "guard"
  gem "guard-rspec"
  gem "pry-rails"
  gem "rspec-rails", "~> 3.4"
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem "launchy"
  gem "poltergeist"
  gem "shoulda-matchers", require: false
  gem "simplecov", require: false
  gem "timecop"
  gem "webmock"
end

group :staging, :production do
  gem "rack-timeout"
end
