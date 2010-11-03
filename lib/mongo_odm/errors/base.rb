module MongoODM 

  module Errors 
  #------------

    # 
    # class. MongoODM::Errors::Base
    #
    # The +MongoODM::Errors::Base+ class is the base class for all MongoODM
    # errors.
    # 
    class Base < StandardError
    #-------------------------
      
      # the 
      BASE_KEY = "mongo_odm.errors.messages"

      # 
      # method. translate
      #
      # The +translate+ method supplies a locale sensitive error messages 
      # identified by the given key.
      #
      # returns:
      # A localized error message string.
      #
      def translate( key, options )
      #----------------------------
        ::I18n.translate( "#{BASE_KEY}.#{key}", options )
      end

    end

  end

end
