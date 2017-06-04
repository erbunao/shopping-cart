require './lib/product'

class OneGbDatapackProduct < Product
  def initialize(opts = {})
    @opts = opts
    super(details)
  end

  private

  attr_reader :opts

  def details
    {
      price: opts[:price] || 9.90,
      code: opts[:code] || "one_gb",
      name: opts[:name] || "1GB Data-pack",
    }
  end
end
