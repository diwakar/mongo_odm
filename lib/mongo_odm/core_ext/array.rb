#
# class. Array
#
class Array
#----------

  #
  # method. from
  #
  # The -from- method creates an instance of an +Array+ from the given 
  # -value-.
  # 
  def self.from( value )
  #---------------------
    
    return nil if value.nil?
    
    if value.respond_to?( :to_ary )
      value.to_ary
    elsif value.respond_to?( :to_a )
      value.to_a
    else
      [ value ]
    end
    
  end
  
  #
  # method. to_bson
  #
  # The -to_bson- method returns a BSON compatible copy of this +Array+ 
  # instance.
  #
  def to_bson
  #----------
    self.map { | element | element.to_bson }
  end

end
