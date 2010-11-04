# encoding: utf-8

require 'rubygems'

require 'active_support'
require 'active_model'
require 'mongo'

require 'mongo_odm/core_ext'
require 'mongo_odm/configuration'
require 'mongo_odm/connection_configuration'
require 'mongo_odm/connection_orchestrator'
require 'mongo_odm/connection_adapter'
require 'mongo_odm/collection'
require 'mongo_odm/cursor'
require 'mongo_odm/errors'
require 'mongo_odm/document'

# is the mongo_odb running in a rails application
if defined?(Rails)
  require 'mongo_odm/rails'
end