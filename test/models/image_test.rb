require "test_helper"

describe Image do
  fixtures :images
  fixtures :establishments

  before do
    @image_valid = images(:image_1)
    @image_invalid = Image.new
  end

  context "Validations" do
    it "must be valid" do
      @image_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @image_invalid.valid?.must_equal false
      @image_invalid.errors.size.must_equal 1
      @image_invalid.errors[:establishment_id].wont_be_nil
    end
  end

  context "Relations" do
    it "must link a requisition with a user" do
      @image_valid.establishment = establishments(:establishment_1)

      @image_valid.valid?.must_equal true
      @image_valid.establishment.must_be_same_as establishments(:establishment_1)
    end
  end
end