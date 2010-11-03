#
# class. Symbol
#
class Symbol
#-----------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Symbol+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    String.from( value ).intern
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +Symbol+ is self).
  #  
  def to_bson
  #----------
    self
  end
  
end