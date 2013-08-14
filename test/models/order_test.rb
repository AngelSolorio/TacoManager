require "test_helper"

describe Order do
  fixtures :orders
  fixtures :users
  fixtures :establishments
  fixtures :requisitions

  before do
    @order_valid = orders(:order_1)
    @order_invalid = Order.new
  end

  context "Validations" do
    it "must be valid" do
      @order_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @order_invalid.valid?.must_equal false
      @order_invalid.errors.size.must_equal 3
      @order_invalid.errors[:user_id].wont_be_nil
      @order_invalid.errors[:establishment_id].wont_be_nil
      @order_invalid.errors[:requisition_id].wont_be_nil
    end
  end

  context "Relations" do
    it "must link a user, establisment and a requisition" do
      @order = Order.new
      @order.user = users(:user_2)
      @order.establishment = establishments(:establishment_1)
      @order.requisition = requisitions(:requisition_1)
      @order.save

      @order.valid?.must_equal true
      @order.user.must_be_same_as users(:user_2)
      @order.establishment.must_be_same_as establishments(:establishment_1)
      @order.requisition.must_be_same_as requisitions(:requisition_1)
    end

    it "must be unique" do
      @order_2 = Order.new
      @order_2.user = users(:user_1)
      @order_2.establishment = establishments(:establishment_1)
      @order_2.requisition = requisitions(:requisition_1)

      @order_2.valid?.must_equal false
      @order_2.errors.size.must_equal 1
      @order_2.errors[:user_id].wont_be_nil
      @order_2.errors[:establishment_id].wont_be_nil
      @order_2.errors[:requisition_id].wont_be_nil
    end
  end
end
