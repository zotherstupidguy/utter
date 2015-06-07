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
  # generate a sample app 
  # `cp /utter_sample .`
end

Rake::TestTask.new :api => [:run_sample] do |t|
  t.libs       = ['lib']
  t.warning    = true
  t.verbose    = true
  t.test_files = FileList['spec/api_spec/api_spec.rb']
end

task :console do
  require 'irb'
  require 'irb/completion'
  #require 'utter' # You know what to do.
  ARGV.clear
  IRB.start
end

task :my_task, [:arg1, :arg2] do |t, args|
    puts "Args were: #{args}"
end

task :project_folder, [:project_title] do |t, args|
  p "creating " + args[:project_title]
  FileUtils.mkdir_p "#{args[:project_title]}/lib/users/v1"
  FileUtils.mkdir_p "#{args[:project_title]}/spec/users/v1"

  # Creates a config.ru
  open("#{args[:project_title]}/config.ru", 'a') { |f|
    print "Creating #{args[:project_title]}\'s config.ru\n"
    f.puts "def hello."
    f.puts " Hello, world."
    f.puts "end"
  }

  # Creates a Gemfile 
  open("#{args[:project_title]}/Gemfile", 'a') { |f|
    print "Creating #{args[:project_title]}\'s Gemfile \n"
    f.puts "def hello."
    f.puts " Hello, world."
    f.puts "end"
  }

  # Creates a README.md 
  open("#{args[:project_title]}/README.md", 'a') { |f|
    print "Creating #{args[:project_title]}\'s README.md \n"
    f.puts "def hello."
    f.puts " Hello, world."
    f.puts "end"
  }

end

desc "Creates a new Utter model"
task :model, [:project_title] do |t, args|
  p "creating model" + args[:project_title]

  open("#{args[:project_title]}/lib/users/v1/model.rb", 'a') { |f|
    f.puts "def hello."
    f.puts " Hello, world."
    f.puts "end"
  }
end

desc "Creates a new Utter endpoint"
task :endpoint do
  puts "creating endpoint.rb" + $DONE
end

# > utter new #projectname  
#	├── config.ru
#	├── Gemfile
#	├── lib
#	│   ├── services
#	│   │   └── v1
#	│   │       ├── endpoint.rb
#	│   │       └── model.rb
#	│   └── users
#	│       ├── v1
#	│       │   ├── endpoint.rb
#	│       │   └── model.rb
#	├── project_name.gemspec
#	├── Rakefile
#	├── README.md
#	└── spec
#   	    ├─ helper.rb
#	    ├── services
#	    │   └── v1
#	    │       ├── endpoint_spec.rb
#	    │       └── model_spec.rb
#	    └── users
# utter new #projectname
# utter new endpoint services # generates lib/services/v1/endpoint.rb and model.rb spec/services/v1/endpoint_spec.rb and model_spec.rb
# utter package services # makes a gem out of services endpoint
#task :my_task, [:arg1, :arg2] do |t, args|
#  puts "Args were: #{args}"

desc "Creates a new Utter Project"
task :new, [:project_title] do |t, args| 
  Rake::Task[:project_folder].invoke(args[:project_title])
  #Rake::Task[:endpoint].invoke(args[:project_title])
  Rake::Task[:model].invoke(args[:project_title])

  #puts "creating a #{ENV["ver"]} of #{ENV["model"]}"
  #
  #puts "Utter is " + $READY
end


desc "Show a random savvy qoute"
task :qoute do 
  puts "some smart qoute!"
end
