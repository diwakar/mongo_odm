#
# class. Hash
#
class Hash
#---------------

  #
  # method. from
  #
  # The -from- method creates an instance of a +Hash+ from the given
  # -value-.
  # 
  def self.from( value )
  #---------------------
    return nil if value.nil?
    raise ArgumentError unless value.respond_to?( :to_hash )
    value.to_hash
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