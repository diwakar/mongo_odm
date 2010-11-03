# encoding: utf-8

# required files
require 'mongo_odm/document/fields'
require 'mongo_odm/document/attribute_methods'
require 'mongo_odm/document/identity'
require 'mongo_odm/document/connection'
require 'mongo_odm/document/collection'
require 'mongo_odm/document/persistence'
require 'mongo_odm/document/validations'
require 'mongo_odm/document/callbacks'
require 'mongo_odm/document/finder_methods'

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

    extend ActiveSupport::Concern

    included do
                  
      include ActiveModel::Serialization

      include MongoODM::Document::Fields
      include MongoODM::Document::AttributeMethods
      include MongoODM::Document::Identity
            
      include MongoODM::Document::Connection
      include MongoODM::Document::Collection
      include MongoODM::Document::Persistence

      include MongoODM::Document::Validations
      include MongoODM::Document::Callbacks

      include MongoODM::Document::FinderMethods

    end

    #--------------------------------------------------------------------------
    #

    #
    # method. instantiate
    #
    def self.instantiate( attributes, options = {} )
    #-----------------------------------------------
    
      # symbolize the option keys
      options.symbolize_keys!
    
      # extract the class name or class from the attributes or options; the 
      # 'bang' option permit the caller to force the class
      _class =  
        options[ :class! ] ||
        attributes.delete( '_class_name' ) || 
        options[ :class ]
      
      #
      raise 'The document class was not provided.' if _class.blank?
      
      # attempt to derive the class (from the class name) unless it's alreadu
      # a class
      _class = _class.to_s.constantize unless _class.is_a?( Class )
      
      #
      document = _class.new( attributes )
      
      #
      options = document.mark_new( options[ :new ] ) \
        if options.include?( :new )    
      
      # return the document
      document
    
    end

    #--------------------------------------------------------------------------
    #
    
    module ClassMethods
    #------------------
      
      #
      #
      #
      def inherited( superclass )
      #--------------------------  
        super( superclass )
      end
      
    end

    #--------------------------------------------------------------------------
    #
            
    #
    # method. initialize
    #
    def initialize( new_attributes = {} )
    #------------------------------------
      
      @attributes = HashWithIndifferentAccess.new
      
      @attributes[ :_class_name ] = self.class.name 
      load_attributes_or_defaults( new_attributes )
      
      # the document is new
      self.mark_new
            
      # the document is not destroyed
      self.mark_destroyed( false )
      
      # if a block has been given, yield this Document instance to the block
      yield self if block_given?

      # run the 'after intialize' callback
      run_callbacks( :initialize )
      
      # generate the document id if none has been assigned
      self.generate_id if self.id.nil?
      
    end

    #--------------------------------------------------------------------------
    #

    #
    # method. new?
    #
    def new?
    #-------
      @_new
    end

    #
    # method. mark_new
    #
    def mark_new( _new = true )
    #--------------------------
      @_new = _new
    end

    #
    # method. destroyed?
    #
    def destroyed?
    #-------------
      @_new
    end

    #
    # method. mark_destroyed
    #
    def mark_destroyed( _destroyed = true )
    #-------------------------------------
      @_destroyed = _destroyed
    end
    
  end
  
end
