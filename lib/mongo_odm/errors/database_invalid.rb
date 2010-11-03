module MongoODM
#--------------
  
  module Errors
  #------------

    # 
    # class. DatabaseInvalid
    #
    # The +DatabaseInvalid+ class represents a Mongo database related error.
    #
    # Typically, this error is raised when the database is not configured or
    # is configured incorrectly. It may also be raised if the database host 
    # is unreachable, the db daemon is not running, etc.
    #
    class DatabaseInvalid < MongoODM::Errors::Base
    #---------------------------------------------
     
      #
      # method. initialize
      #
      # The +initialize+ method constructs an instance of the database error.
      #
      def initialize( database )
      #-------------------------
        super(
          translate( "database_invalid", { :name => database.class.name } )
        )
      end
      
    end
    
  end
  
end