#
# class. Integer
#
class Integer
#------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Integer+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    value.respond_to( :to_i ) ?
      value.to_i :
      String.from( value ).to_i
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +Integer+ is self).
  #  
  def to_bson
  #----------
    self
  end
  
end