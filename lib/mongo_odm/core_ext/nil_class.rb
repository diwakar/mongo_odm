#
# class. NilClass
#
class NilClass
#---------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +NilClass+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    nil
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +NilClass+ is simply -nil-).
  #  
  def to_bson
  #----------
    nil
  end
  
end