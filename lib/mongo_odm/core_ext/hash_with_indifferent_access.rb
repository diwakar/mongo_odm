#
require 'active_support/hash_with_indifferent_access'

#
# class. HashWithIndifferentAccess
#
class HashWithIndifferentAccess
#------------------------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +HashWithIndifferentAccess+ 
  # from the given -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    Hash.from( value ).with_indifferent_access
  end

  #
  # method. to_bson
  #
  # The -to_bson- method returnd a BSON compatible representation of this
  # instance.
  #  
  def to_bson
  #----------
    Hash[ self.map { | key, value | [ key.to_bson, value.to_bson ] } ]
  end
  
end