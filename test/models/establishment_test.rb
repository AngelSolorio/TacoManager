require "test_helper"

describe Establishment do
  fixtures :establishments

  before do
    @establishment_valid = establishments(:establishment_1)
    @establishment_invalid = Establishment.new
  end

  context "Validations" do
    it "must be valid" do
      @establishment_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @establishment_invalid.valid?.must_equal false
      @establishment_invalid.errors.size.must_equal 3
      @establishment_invalid.errors[:address].wont_be_nil
      @establishment_invalid.errors[:phone].wont_be_nil
      @establishment_invalid.errors[:schedule].wont_be_nil
    end
  end

end
