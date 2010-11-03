#
# class. Float
#
class Float
#---------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Float+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    value.respond_to( :to_f ) ?
      value.to_f :
      String.from( value ).to_f
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +Float+ is self).
  #  
  def to_bson
  #----------
    self
  end
  
end