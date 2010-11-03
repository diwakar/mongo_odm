#
require 'active_support/core_ext/big_decimal'

#
# class. BigDecimal
#
class BigDecimal
#---------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +BigDecimal+ from the given
  # -value-.
  # 
  # If the -value- is an +BigDecimal+ it is returned unchanged.  
  #  
  def self.from( value )
  #---------------------
    return nil if value.nil?
    value.is_a?( BigDecimal ) ? value : new( value.to_s )  
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance +BigDecimal+ instance.
  #  
  def to_bson
  #----------
    self.to_s
  end

end
