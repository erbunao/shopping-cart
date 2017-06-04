require "spec_helper"

describe ShoppingCart do
  describe "#total" do
    it "uses 3 for 2 deal for Unlimited 1GB Sims" do
      pricing_rules = [UltSmallTwoForThreeDiscount]
      cart = ShoppingCart.new(pricing_rules)
      item1 = build(:product, :small)
      item2 = build(:product, :small)
      item3 = build(:product, :small)
      item4 = build(:product, :large)

      add_to_cart([item1, item2, item3, item4], cart)

      expect(cart.total).to eq(94.70)
    end

    it "uses bulk discount for Unlimited 5GB Sims" do
      pricing_rules = [UltSmallTwoForThreeDiscount, UltLargeBulkDiscount]
      cart = ShoppingCart.new(pricing_rules)
      item1 = build(:product, :small)
      item2 = build(:product, :small)
      item3 = build(:product, :large)
      item4 = build(:product, :large)
      item5 = build(:product, :large)
      item6 = build(:product, :large)

      add_to_cart([item1, item2, item3, item4, item5, item6], cart)

      expect(cart.total).to eq(209.40)
    end

    it "uses free 1GB data pack for every Unlimited 2GB Sim" do
      pricing_rules = [UltMediumFreeOneGbDatapackDiscount]
      cart = ShoppingCart.new(pricing_rules)
      item1 = build(:product, :small)
      item2 = build(:product, :medium)
      item3 = build(:product, :medium)

      add_to_cart([item1, item2, item3], cart)

      expect(cart.total).to eq(84.70)
    end

    it "uses the promo code discount" do
      pricing_rules = []
      cart = ShoppingCart.new(pricing_rules)
      item1 = build(:product, :small)
      item2 = build(:product, :one_gb)
      promo_code = "I<3PROMO"

      cart.add(item1, promo_code)
      cart.add(item2, promo_code)

      expect(cart.total).to eq(31.32)
    end
  end

  describe "#items" do
    it "returns the items breakdown" do
      pricing_rules = [UltSmallTwoForThreeDiscount, UltLargeBulkDiscount]
      cart = ShoppingCart.new(pricing_rules)
      item1 = build(:product, :small)
      item2 = build(:product, :small)
      item3 = build(:product, :large)
      item4 = build(:product, :large)
      item5 = build(:product, :large)
      item6 = build(:product, :large)

      add_to_cart([item1, item2, item3, item4, item5, item6], cart)

      expect(cart.items).to eq({
        "Unlimited 1GB" => 2,
        "Unlimited 5GB" => 4,
      })
    end

    it "returns the items breakdown with free items" do
      pricing_rules = [UltMediumFreeOneGbDatapackDiscount]
      cart = ShoppingCart.new(pricing_rules)
      item1 = build(:product, :small)
      item2 = build(:product, :medium)
      item3 = build(:product, :medium)

      add_to_cart([item1, item2, item3], cart)

      expect(cart.items).to eq({
        "Unlimited 1GB" => 1,
        "Unlimited 2GB" => 2,
        "1GB Data-pack" => 2,
      })
    end
  end

  private

  def add_to_cart(items, cart)
    items.each { |item| cart.add(item) }
  end
end
