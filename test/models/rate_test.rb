require "test_helper"

describe Rate do
  fixtures :rates
  fixtures :users
  fixtures :establishments

  before do
    @rate_valid = rates(:rate_1)
    @rate_invalid = Rate.new
  end

  context "Validations" do
    it "must be valid" do
      @rate_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @rate_invalid.valid?.must_equal false
      @rate_invalid.errors.size.must_equal 2
      @rate_invalid.errors[:user_id].wont_be_nil
      @rate_invalid.errors[:establishment_id].wont_be_nil
    end
  end

  context "Relations" do
    it "must link a user and an establishment" do
      rate = Rate.new
      rate.user = users(:user_1)
      rate.establishment = establishments(:establishment_1)

      rate.valid?.must_equal true
      rate.user.must_be_same_as users(:user_1)
      rate.establishment.must_equal establishments(:establishment_1)
    end
  end
end
