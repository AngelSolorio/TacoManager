require "test_helper"

describe Requisition do
  fixtures :requisitions

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
      @requisition_invalid.errors.size.must_equal 3
      @requisition_invalid.errors[:cost].wont_be_nil
      @requisition_invalid.errors[:checktime].wont_be_nil
      @requisition_invalid.errors[:status].wont_be_nil
    end
  end
end