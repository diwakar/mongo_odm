#
# class. String
#
class String
#-----------

  #
  # method. from
  #
  # The -from- method creates an instance of a +String+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    value.respond_to?( :to_str ) ?
      value.to_str :
      value.to_s
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +String+ is self).
  #  
  def to_bson
  #----------
    self
  end
  
end