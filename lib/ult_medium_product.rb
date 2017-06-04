require './lib/product'

class UltMediumProduct < Product
  def initialize(opts = {})
    @opts = opts
    super(details)
  end

  private

  attr_reader :opts

  def details
    {
      price: opts[:price] || 29.90,
      code: opts[:code] || "ult_medium",
      name: opts[:name] || "Unlimited 2GB",
    }
  end
end
