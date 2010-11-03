#
# class. Numeric
#
class Numeric
#---------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Numeric+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    float_value = Float.from( value )
    integer_value = Integer.from( value )
    float_value == int_value ? int_value : float_value  
  end
  
end