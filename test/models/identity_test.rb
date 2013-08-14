require "test_helper"

describe Identity do
  fixtures :identities

  before do
    @identity_valid = identities(:identity_1)
    @identity_invalid = Identity.new
  end

  context "Validations" do
    it "must be valid" do
      @identity_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @identity_invalid.valid?.must_equal false
      @identity_invalid.errors.size.must_equal 5
      @identity_invalid.errors[:name].wont_be_nil
      @identity_invalid.errors[:email].wont_be_nil
      @identity_invalid.errors[:password_digest].wont_be_nil
    end
  end
end
