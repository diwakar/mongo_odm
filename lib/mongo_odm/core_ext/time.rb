#
# class. Time
#
class Time
#---------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Time+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    value.respond_to?( :to_time ) ?
      value.to_time :
      Time.parse( String.from( value ) )
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +Time+ is self).
  #  
  def to_bson
  #----------
    self
  end
  
end