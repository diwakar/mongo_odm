#
# class. Date
#
class Date
#---------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Date+ from the given -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    value.respond_to?( :to_date ) ?
      value.to_date :
      Date.parse( value.to_s )
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # +Date+ instance.
  # 
  def to_bson
  #----------
    Time.utc( self.year, self.month, self.day )
  end
  
end