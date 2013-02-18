source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '>= 3.2.6'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
 gem 'sass-rails',   '~> 3.2.3'
 gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end


gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# To use debugger
# gem 'debugger'

gem 'bundler'
gem 'mongo'
gem 'mongoid'
gem 'mongoid-history'
gem 'mongoid-data_table', :git => 'git://github.com/shamanime/mongoid-data_table.git'
gem 'mongoid_rails_migrations'
# gem 'mongoid-app_settings'
gem 'delayed_job_mongoid', :git => 'git://github.com/asavartsov/delayed_job_mongoid.git'
gem 'thin'
gem 'devise'
gem 'haml'
gem 'bson_ext'
gem 'delayed_job'
gem 'xml-simple'
gem 'state_machine'
gem 'state_machine-audit_trail'
gem 'htmlentities'
gem 'google-webfonts'
gem 'mongoid-app_settings'

# Client side validations
gem 'client_side_validations'
gem 'client_side_validations-mongoid'
gem 'client_side_validations-simple_form'

gem 'simple_form'
gem 'memcache-client'

# Editor-related
gem 'ckeditor', '~> 4.0.0'
gem 'mini_magick'
gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'file_browser', git: 'git://github.com/bitcababy/file_browser.git'
gem 'cloudfiles' # http://rubydoc.info/gems/cloudfiles/1.5.0.1/frames

gem 'ruby-mysql'
gem 'tidy_ffi'
gem 'daemons'
gem 'pry'

gem 'yard'

# gem "activeadmin-mongoid",  git: "git://github.com/elia/activeadmin-mongoid.git"

group :development, :test do
  gem 'heroku'
  gem 'heroku_san'
	gem 'rspec-rails'
	gem 'watchr'#,  :git => 'git://github.com/bitcababy/watchr.git'
	gem 'guard'
	gem 'guard-rspec'
	gem 'guard-cucumber'
	gem 'guard-coffeescript'
	gem 'guard-bundler'
	# gem 'guard-sass'
	gem 'guard-haml'
	gem 'guard-sprockets2'
	gem 'growl_notify'
	gem 'fabrication', '>= 2.0'
	gem 'foreman'
  # gem 'perftools.rb', :git => 'git://github.com/tmm1/perftools.rb.git'
end

group :development do
	gem 'haml-rails'
end

group :test do
	gem 'rspec-instafail'
	gem 'mongoid-rspec'
  gem 'spork-rails'
  gem 'rspec-rails-mocha'
  gem 'rspec-html-matchers'
  gem 'rspec-given'

	gem 'nokogiri', '= 1.5.2'
	gem 'capybara'
	gem 'database_cleaner'
  gem 'capybara-webkit'
	gem 'hpricot'
	gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
	gem 'email_spec'
	gem 'webrat'
  gem 'websocket'
	# Warden stuff
	gem 'warden'
	gem 'rails_warden'
	gem 'guard-sass', :require => false
  gem 'rb-fsevent', '~>0.9.1'
end

