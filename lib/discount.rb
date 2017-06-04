class Discount
  def initialize(products)
    @products = products
  end

  def price
  end

  def remaining_products
  end

  def additional_products
    []
  end

  private

  attr_reader :products
end
