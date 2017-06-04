require './lib/product'

class UltSmallProduct < Product
  def initialize(opts = {})
    @opts = opts
    super(details)
  end

  private

  attr_reader :opts

  def details
    {
      price: opts[:price] || 24.90,
      code: opts[:code] || "ult_small",
      name: opts[:name] || "Unlimited 1GB",
    }
  end
end
