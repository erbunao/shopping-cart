require './lib/product'

class UltLargeProduct < Product
  def initialize(opts = {})
    @opts = opts
    super(details)
  end

  private

  attr_reader :opts

  def details
    {
      price: opts[:price] || 44.90,
      code: opts[:code] || "ult_large",
      name: opts[:name] || "Unlimited 5GB",
    }
  end
end
