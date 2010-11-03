require 'singleton'

#
# module. MongoODM
#
module MongoODM
#--------------
  
  #
  #
  #
  def self.default_configuration( &block )
  #---------------------------------------
    Configuration.instance().instance_eval( &block ) unless block.nil?
    Configuration.instance()
  end
  
  #
  # class. Configuration
  #
  # The +Configuration+ class is a singleton 
  #
  class Configuration
  #------------------
    
    #
    include Singleton

    #--------------------------------------------------------------------------
    # queries
    
    #
    #
    #
    def from_hash( configuration )
    #-----------------------------
      
      configuration.each_pair do | name, value |
        
        if self.respond_to?( "#{name}=" )
          self.send( "#{name}=", value)
        elsif self.database_master.respond_to?( "#{name}=" )
          self.database_master.send( "#{name}=", value )
        end
        
      end
            
    end

    #
    # method. database_master=
    #
    # The +database_master=+ method assigns 
    #
    def database_master=( configuration )
    #------------------------------------
      self.database_master.from( configuration )
    end

    alias :database= :database_master=
    alias :master= :database_master=

    #
    #
    #
    def database_master
    #------------------
      @database_master = ConnectionConfiguration.new \
        if @database_master.nil?
      @database_master
    end

    alias :database :database_master
    alias :master :database_master

    #
    #
    #
    def database_slaves=( slaves )
    #-----------------------------
    
      @database_slaves = []
    
      [ slaves ].flatten.compact.each do | slave_configuration |
        @database_slaves = 
          ConnectionConfiguration.new( slave_configuration )
      end

    end
    
    alias :slaves= :database_slaves=

    #
    #
    #
    def database_slaves
    #------------------
      @database_slaves || []
    end

    alias :slaves= :database_slaves=
    
  end

end