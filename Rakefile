require "bundler"
Bundler.setup

require "rake"

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "mongo_odm/version"

task :build do
  system "gem build mongo_odm.gemspec"
end

task :install => :build do
  system "sudo gem install mongo_odm-#{MongoODM::VERSION}.gem"
end

task :release => :build do
  puts "Tagging #{MongoODM::VERSION}..."
  system "git tag -a #{MongoODM::VERSION} -m 'Tagging #{MongoODM::VERSION}'"
  puts "Pushing to Github..."
  system "git push --tags"
  #puts "Pushing to rubygems.org..."
  #system "gem push mongo_odm-#{MongoODM::VERSION}.gem"
end

if Gem.available? 'rspec'

  require "rspec"
  require "rspec/core/rake_task"

  Rspec::Core::RakeTask.new( :spec ) do | spec |
    spec.pattern = "test/**/*_test.rb"
  end

  Rspec::Core::RakeTask.new( 'spec:progress' ) do | spec |
    spec.rspec_opts = %w(--format progress)
    spec.pattern = "test/**/*_test.rb"
  end

end