#
# class. TrueClass
#
class TrueClass
#--------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +TrueClass+ from the given
  # -value-.
  # 
  def self.type_cast(value)
  #------------------------
    return nil if value.nil?
    false
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +TrueClass+ is self).
  #  
  def to_bson
  #----------
    self
  end
  
end