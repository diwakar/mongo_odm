module Boolean
  def self.from(value)
    case value
    when NilClass
      nil
    when Numeric
      !value.zero?
    when TrueClass, FalseClass
      value
    when /^\s*t/i
      true
    when /^\s*f/i
      false
    else
      value.present?
    end
  end
end