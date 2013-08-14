require "test_helper"

describe Comment do
  fixtures :comments

  before do
    @comment_valid = comments(:comment_1)
    @comment_invalid = Comment.new
  end

  context "Validations" do
    it "must be valid" do
      @comment_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @comment_invalid.valid?.must_equal false
      @comment_invalid.errors.size.must_equal 4
      @comment_invalid.errors[:user_id].wont_be_nil
      @comment_invalid.errors[:establishment_id].wont_be_nil
      @comment_invalid.errors[:description].wont_be_nil
    end
  end
end
