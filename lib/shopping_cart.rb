class ShoppingCart
  def initialize(pricing_rules)
    @sum = 0
    @products = []
    @promo_code = nil
    @pricing_rules = pricing_rules || []
  end

  def add(item, promo_code = nil)
    set_promo_code(promo_code)
    products << item
  end

  def total
    process_discounts
    add_undiscounted_products
    use_promo_code

    sum.round(2)
  end

  def items
    process_discounts

    products.group_by(&:name).map { |name, array| [name, array.count] }.to_h
  end

  private

  attr_reader(
    :sum,
    :products,
    :promo_code,
    :pricing_rules,
    :undiscounted_products,
  )

  def use_promo_code
    @sum = PromoCode.apply(promo_code: promo_code, sum: sum)
  end

  def process_discounts
    @undiscounted_products = pricing_rules.inject(products) do |result, rule|
      pricing_rule = rule.new(result)
      @sum += pricing_rule.price
      products.concat(pricing_rule.additional_products)
      pricing_rule.remaining_products
    end
  end

  def add_undiscounted_products
    remaining_sum = undiscounted_products.map(&:price).reduce(:+) || 0
    @sum += remaining_sum
  end

  def set_promo_code(promo_code)
    @promo_code ||= promo_code
  end
end
