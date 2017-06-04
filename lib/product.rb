class Product
  attr_accessor :code, :name, :price

  def initialize(opts = {})
    @code = opts[:code]
    @name = opts[:name]
    @price = opts[:price]
  end
end
