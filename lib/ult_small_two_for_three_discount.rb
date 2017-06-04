require './lib/discount'

class UltSmallTwoForThreeDiscount < Discount
  def price
    ult_small_products.any? ? get_discount : 0
  end

  def remaining_products
    products - ult_small_products
  end

  private

  attr_reader :products

  def get_discount
    (2 * ult_small_products.count / 3.0).ceil * ult_small_price
  end

  def ult_small_products
    products.select { |product| product.code === "ult_small" }
  end

  def ult_small_price
    ult_small_products.last.price
  end
end
