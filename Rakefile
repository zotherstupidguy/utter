require 'rake/testtask'

#  Don't push the gem to rubygems
#  ENV["gem_push"] = "false" # Utilizes feature in bundler 1.3.0

#  Let bundler's release task do its job, minus the push to Rubygems,
#  and after it completes, use "gem inabox" to publish the gem to our
#  internal gem server.
#
#  OR 
#
#  install gem on remote gem server to make it avaialable to download

#Rake::Task["release"].enhance do
#  spec = Gem::Specification::load(Dir.glob("*.gemspec").first)
#  sh "gem inabox pkg/#{spec.name}-#{spec.version}.gem"
#end

task :run_sample do 
  # unless sample is running, run sample app
end

#task :test_api => [:run_sample] do
#  puts "Ready for the day!"
#end

Rake::TestTask.new :api => [:run_sample] do |t|
  t.libs       = ['lib']
  t.warning    = true
  t.verbose    = true
  t.test_files = FileList['spec/api_spec/api_spec.rb']
end

task :console do
  require 'irb'
  require 'irb/completion'
  require 'my_gem' # You know what to do.
  ARGV.clear
  IRB.start
end
