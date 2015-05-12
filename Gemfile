source 'https://rubygems.org' 

gemspec #should be removed or move :production, :development, :test to gemspec?

group :production do 
  gem 'redis'
end

group :development, :test do
  gem 'redis'
  gem 'rake'
  gem 'rack'
  #gem 'rack-test', '>= 0.6.2'
  gem "minitest"
end
