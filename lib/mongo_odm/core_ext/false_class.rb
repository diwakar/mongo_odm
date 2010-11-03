#
# class. FalseClass
#
class FalseClass
#---------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +FalseClass+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    false
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +FalseClass+ is self).
  #  
  def to_bson
  #----------
    self
  end
  
end
