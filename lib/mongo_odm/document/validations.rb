#
# module. MongoODM
#
module MongoODM
#--------------

  #
  # module. Document
  #
  module Document
  #--------------

    #
    # module. Validations
    #
    module Validations
    #---------------
    
      extend ActiveSupport::Concern
    
      included do
      
        include ActiveModel::Validations

      end

      #------------------------------------------------------------------------
      #

      #
      #
      #
      def save( options = {} )
      #-----------------------
        perform_validations( options ) ? super( options ) : false
      end
            
      #
      #
      #
      def valid?( context = nil )
      #--------------------------
        context ||= ( new? ? :create : :update )
        output = super( context )
        errors.empty? && output
      end

      #------------------------------------------------------------------------
      #

      #
      #
      #
      protected; def perform_validations( options = {} )
      #-------------------------------------------------
        perform_validation = options[ :validate ] != false
        perform_validation ? valid?( options[ :context ] ) : true
      end
    
    end
    
  end

end
