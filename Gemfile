source 'https://rubygems.org'
git_source(:github) { |repo| 'https://github.com/#{repo}.git' }

ruby '2.6.5'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry', '0.13.0'
  gem 'rubocop-performance', '~> 1.5.2', require: false
  gem 'rubocop-rails', '~> 2.4.2', require: false
  gem 'rubocop-rspec', '~> 1.38.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_bot_rails', '~> 5.1.1'
  gem 'faker', '2.11.0'
  gem 'shoulda-matchers', '~> 4.2.0'
  gem 'rspec-rails', '~> 3.9.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
