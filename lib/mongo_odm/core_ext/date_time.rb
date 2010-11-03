#
# class. DateTime
#
class DateTime
#---------

  #
  # method. from
  #
  # The -from- method creates an instance of a +DateTime+ from the given 
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    value.respond_to?( :to_datetime ) ?
      value.to_datetime :
      DateTime.parse( String.from( value ) )
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # +DateTime+ instance.
  # 
  def to_bson
  #----------
    dt = self.utc
    Time.utc( dt.year, dt.month, dt.day, dt.hour, dt.min, dt.sec )
  end
  
end