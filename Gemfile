source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

gem "bootsnap", require: false
gem "importmap-rails", "~> 1.1"
gem "jbuilder", "~> 2.11"
gem "puma", "~> 5.6"
gem "rails", "7.0.4"
gem "sassc-rails"
gem "sprockets-rails", "~> 3.4"
gem "stimulus-rails", "~> 1.0"
gem "turbo-rails", "~> 1.1"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "figaro"
  gem "rspec-rails", "5.1.2"
  gem "sqlite3", "~> 1.4"
end

group :development do
  gem "web-console"
end

group :production do
  gem "pg", "1.3.5"
end

