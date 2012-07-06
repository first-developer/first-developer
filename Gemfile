source 'http://rubygems.org'


# CORE GEMS
# ==============================================
gem 'rails', '3.1.6'
gem 'jquery-rails'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# DATABASES
# ==============================================
#gem 'sqlite3'
gem "mysql2"

# ASSETS 
# ==============================================
group :assets do
  gem 'sass-rails',   '3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
  #gem 'twitter-bootstrap-rails'
  gem 'bootstrap-sass', '~> 2.0.2', git: 'https://github.com/thomas-mcdonald/bootstrap-sass.git'
  #gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
  #                           :git => 'git://github.com/anjlab/bootstrap-rails.git'
  gem 'bourbon'
  gem "select2-rails", path: '/Users/firstdeveloper/Playground/Web/select2-rails/'
  gem 'oily_png'
  gem 'compass-rails'
end


# DEVELOPMENT
# ==============================================
group :development do
  	gem 'rspec-rails', '2.6.1'
  	gem 'annotate', '2.4.0'
  	gem 'nifty-generators'   	# another scaffold
  	gem 'faker', '0.3.1'
  	gem 'guard'
	gem 'pry'
	gem 'pry-nav'
  	#gem 'libnotify'
end


# PRODUCTION
# ==============================================


# TESTS
# ==============================================
group :test do
    gem 'turn', '~> 0.8.3', :require => false # Pretty printed test output
    gem 'shoulda',  '<= 2.0.6'
    gem 'rspec-rails', '2.6.1'
    gem 'webrat', '0.7.1'
    gem 'spork', '0.9.0.rc5'
    gem 'factory_girl_rails', '1.0'
    gem 'cucumber-rails'
    gem 'capybara'
    gem 'launchy'
    gem 'database_cleaner'
    gem 'guard-cucumber'
end


group :development, :test do
    gem 'ruby_gntp'
end

# EXTRAS / UTILS
# ==============================================


gem 'slim-rails'		# New template engine
gem "stringex"			# Some [hopefully] useful extensions to Ruby’s String class. 
				# It is made up of three libraries: ActsAsUrl, Unidecoder, and StringExtensions.
gem "RedCloth"
gem "simple_form" 
gem 'rinku'
gem 'country_select'
gem "amplify" 		    # Use Request - Store - Pubsub from AmplifyJS
gem "js-routes" 			# Get access to rails routes in JS files 
gem "video_info" 			# Handle every kind of medias
gem 'redcarpet' 			# Markdown 
gem 'albino'
gem 'nokogiri'
gem 'rack-pygmentize'
gem "lograge"
# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

