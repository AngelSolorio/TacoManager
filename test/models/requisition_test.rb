require "test_helper"

describe Requisition do
  fixtures :requisitions
  fixtures :users

  before do
    @requisition_valid = requisitions(:requisition_1)
    @requisition_invalid = Requisition.new
  end

  context "Validations" do
    it "must be valid" do
      @requisition_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @requisition_invalid.valid?.must_equal false
      @requisition_invalid.errors.size.must_equal 4
      @requisition_invalid.errors[:cost].wont_be_nil
      @requisition_invalid.errors[:checktime].wont_be_nil
      @requisition_invalid.errors[:status].wont_be_nil
      @requisition_invalid.errors[:user_id].wont_be_nil
    end
  end

  context "Relations" do
    it "must link a requisition with a user" do
      @requisition_valid.user = users(:user_2)

      @requisition_valid.valid?.must_equal true
      @requisition_valid.user.must_be_same_as users(:user_2)
    end
  end
end