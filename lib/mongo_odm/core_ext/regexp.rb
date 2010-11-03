#
# class. Regexp
#
class Regexp
#-----------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Regexp+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    new( value )
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +Regexp+ is self).
  #  
  def to_bson
  #----------
    self
  end
  
end