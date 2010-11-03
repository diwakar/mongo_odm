#
# module. MongoODM
#
module MongoODM
#--------------

  #
  # module. Document
  #
  module Document

    #
    # module. Callbacks
    #
    module Callbacks
    #---------------
    
      extend ActiveSupport::Concern
    
      included do
      
        # extend the ActiveModel Callback module; provides 
        # define_model_callbacks method and associated implementation
        extend ActiveModel::Callbacks
        
        # include the ActiveModel Validations Callback module; provides 
        # before and after validation methods and associated implementaiton
        include ActiveModel::Validations::Callbacks

        # define the after_initialize callback
        define_model_callbacks  :initialize, :only => :after
      
        #
        define_model_callbacks  :create
      
        #
        define_model_callbacks  :update
      
        #
        define_model_callbacks  :save
      
        #
        define_model_callbacks  :destroy

      end

      def create_or_update( options = {} )
      #-----------------------------------
        _run_save_callbacks { super( options ) }
      end

      def create( options = {} )
      #-------------------------
        _run_create_callbacks { super( options ) }
      end

      def update( options = {} )
      #-------------------------
        _run_update_callbacks { super( options ) }
      end
      
      def destroy( options = {} )
      #--------------------------
        _run_destroy_callbacks { super( options ) }
      end

    end
    
  end

end
