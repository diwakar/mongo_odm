#
# class. Class
#
class Class
#----------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Class+ from the given -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    value.to_s.constantize
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance (which, in the case of +Class+ is the name of the class).
  #  
  def to_bson
  #----------
    self.name
  end
  
end