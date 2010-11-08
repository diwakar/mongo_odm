# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require "mongo_odm/version"

Gem::Specification.new do | specification |
  
  specification.name                        = "mongo_odm"
  specification.version                     = MongoODM::VERSION
  specification.platform                    = Gem::Platform::RUBY
  specification.authors                     = [ "Kristoph Cichocki-Romanov" ]
  specification.email                       = [ "mongo-odm@kristoph.net" ]
  specification.homepage                    = ""
  specification.summary                     = "An Object Document Mapper Framework for MongoDB written in Ruby."
  specification.description                 = "MongoODM is an Object Document Mapper Framework for MongoDB, written in Ruby."

  specification.required_rubygems_version   = ">= 1.3.6"
  specification.rubyforge_project           = "mongo_odm"

  # production dependencies
  specification.add_dependency( "activemodel", [ "~> 3.0.0" ] )
  specification.add_dependency( "mongo", [ "= 1.1" ] )
  specification.add_dependency( "bson", [ "= 1.1" ] )

  # development dependencies
  #specification.add_development_dependency( "bson_ext", [ "= 1.1" ] )
  specification.add_development_dependency( "rake", [ "~> 0.8.7" ] )
  specification.add_development_dependency( "rspec", [ "~> 2.0.0" ] )

  specification.files                       = Dir.glob( "lib/**/*" ) + %w( LICENSE )
  specification.require_path                = 'lib'

end