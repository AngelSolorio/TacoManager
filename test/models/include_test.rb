require "test_helper"

describe Include do
  fixtures :includes
  fixtures :dishes
  fixtures :orders

  before do
    @include_valid = includes(:include_1)
    @include_invalid = Include.new
  end

  context "Validations" do
    it "must be valid" do
      @include_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @include_invalid.valid?.must_equal false
      @include_invalid.errors.size.must_equal 2
      @include_invalid.errors[:dish_id].wont_be_nil
      @include_invalid.errors[:order_id].wont_be_nil
    end
  end

  context "Relations" do
    it "must link a dish and an establishment" do
      @include = Include.new
      @include.dish = dishes(:dish_2)
      @include.order = orders(:order_1)

      @include.valid?.must_equal true
      @include.dish.must_be_same_as dishes(:dish_2)
      @include.order.must_be_same_as orders(:order_1)
    end

    it "must be unique" do
      @include_2 = Include.new
      @include_2.dish = dishes(:dish_1)
      @include_2.order = orders(:order_1)

      @include_2.valid?.must_equal false
      @include_2.errors.size.must_equal 1
      @include_2.errors[:dish_id].wont_be_nil
      @include_2.errors[:order_id].wont_be_nil
    end
  end
end
