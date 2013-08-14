require "test_helper"

describe Dish do
  fixtures :dishes

  before do
    @dish_valid = dishes(:dish_1)
    @dish_invalid = Dish.new
  end

  context "Validations" do
    it "must be valid" do
      @dish_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @dish_invalid.valid?.must_equal false
      @dish_invalid.errors.size.must_equal 2
      @dish_invalid.errors[:name].wont_be_nil
      @dish_invalid.errors[:price].wont_be_nil
    end
  end
end
