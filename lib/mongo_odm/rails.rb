module Rails
    
  module MongoODM
      
    class Railtie < Rails::Railtie

      config.generators.orm :mongo_odm, :migration => false

#      rake_tasks do
#        load "mongo_odm/rails/tasks/database.rake"
#      end

      # 
      # The MongoODM configuration is exposed through the Rails configuration.
      #
      # example:
      #
      #   module MyApplication
      #     class Application < Rails::Application
      #       config.mongo_odm.logger = Logger.new($stdout, :warn)
      #       config.mongo_odm.reconnect_time = 10
      #     end
      #   end
      config.mongo_odm = ::MongoODM::Configuration.instance

      # 
      # The MongoODM configuration may be defined in a yml file.
      #
      # Example mongoid.yml:
      #
      #   defaults: &defaults
      #     host: localhost
      #     slaves:
      #       # - host: localhost
      #         # port: 27018
      #       # - host: localhost
      #         # port: 27019
      #     allow_dynamic_fields: false
      #     parameterize_keys: false
      #     persist_in_safe_mode: false
      #
      #   development:
      #     <<: *defaults
      #     database: mongoid
      #
      initializer "configure database from file" do
        
        # the mongo_odb configuration file path
        file = Rails.root.join( "config", "mongo_odm.yml")
        
        # is there a a configuration file?
        if file.file?
          
          # if so ...
          
          # read the configuration file; process it through erb and 
          # interpret it using YAML; use the current environment to extract 
          # the configuration
          configuration = 
            YAML.load( ERB.new( file.read ).result )[ Rails.env ] 
          
          # configure MongoODM from the configuration
          ::MongoODM.default_configuration.from_hash( configuration ) \
            if configuration.present?
        
        end
      
      end

      #
      #
      #
      initializer "verify database connection" do
        config.after_initialize do
          begin
            #::Mongoid.master
          #rescue ::Mongoid::Errors::InvalidDatabase => e
            #unless Rails.root.join("config", "mongoid.yml").file?
            #  puts "\nMongoid config not found. Create a config file at: config/mongoid.yml"
            #  puts "to generate one run: rails generate mongoid:config\n\n"
            #end
          end
        end
      end

      # 
      # The MongoODM Due to all models not getting loaded and messing up inheritance queries
      # and indexing, we need to preload the models in order to address this.
      #
      # This will happen every request in development, once in ther other
      # environments.
      initializer "preload all application models" do | application |
        config.to_prepare do
#          ::Rails::Mongoid.load_models( application )
        end
      end

      initializer "reconnect to master if application is preloaded" do
        config.after_initialize do

          # # Unicorn clears the START_CTX when a worker is forked, so if we have
          # # data in START_CTX then we know we're being preloaded. Unicorn does
          # # not provide application-level hooks for executing code after the
          # # process has forked, so we reconnect lazily.
          # if defined?(Unicorn) && !Unicorn::HttpServer::START_CTX.empty?
          #   ::Mongoid.reconnect!(false)
          # end
          # 
          # # Passenger provides the :starting_worker_process event for executing
          # # code after it has forked, so we use that and reconnect immediately.
          # if defined?(PhusionPassenger)
          #   PhusionPassenger.on_event(:starting_worker_process) do |forked|
          #     if forked
          #       ::Mongoid.reconnect!
          #     end
          #   end
          # end
        end
      end
    end
  end
end
