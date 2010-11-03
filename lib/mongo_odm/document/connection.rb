#
# module. MongoODM
#
module MongoODM
  
  #
  # module. Document
  # 
  module Document
  #--------------
  
    #
    # module. Fields
    #
    module Connection
    #----------------

      extend ActiveSupport::Concern

      included do
        
        class_attribute :_connection        
        class_attribute :_database        
        
      end

      module ClassMethods
      #------------------
        
        #
        # method. connection
        #
        def connection
        #-------------
          self._connection ||= establish_connection!
        end

        #
        # method. connection
        #
        def database
        #-----------
          self._database ||= self.connection.database
        end
        
        #----------------------------------------------------------------------
        #
        
        #
        # method. establish_connection
        #
        def establish_connection!( connection_configuration = nil )
        #----------------------------------------------------------
          
          # reset the connection
          self._connection = nil
          
          connection_configuration = MongoODM::default_configuration.master \
            if connection_configuration.nil?
              
          raise MongoODM::Errors::ConfigurationInvalid \
            if connection_configuration.nil?
          
          self._connection = 
            MongoODM::ConnectionOrchestrator::
              retrieve_or_establish_connection( connection_configuration )
                                                       
        end
        
      end

    end

  end

end