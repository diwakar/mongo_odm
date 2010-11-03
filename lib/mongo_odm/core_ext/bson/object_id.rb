class BSON::ObjectId
#-------------------
  
  #
  # method. from
  #
  # The -from- method creates an instance of a +BSON::ObjectId+ from the given
  # -value-.
  # 
  # If the -value- is an +BSON::ObjectId+ it is returned unchanged.  
  #  
  def self.from( value )
  #---------------------

    return nil if value.nil?
    return value if value.is_a?(BSON::ObjectId)
    BSON::ObjectId(value)

  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +BSON::ObjectId+ is self).
  #
  def to_bson
  #----------
    self
  end
  
end