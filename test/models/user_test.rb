require "test_helper"

describe User do
  fixtures :users

  before do
    @user_valid = users(:user_1)
    @user_invalid = User.new
  end

  let(:auth) {
    auth = {
      "provider" => 'identity',
      "uid" => '9876543',
      "info" => { "name" => 'Other Test User', "email" => 'otheruser@test.com' }
    }
  }

  context "Validations" do
    it "must be valid" do
      @user_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @user_invalid.valid?.must_equal false
      @user_invalid.errors.size.must_equal 2
      @user_invalid.errors[:provider].wont_be_nil
      @user_invalid.errors[:name].wont_be_nil
    end
  end

  context "Create user" do
    it "must create user with valid auth" do
      user = User.create_with_omniauth(auth)
      user.valid?.must_equal true
    end

    it "must not create user with invalid auth" do
      lambda { User.create_with_omniauth }.must_raise ArgumentError
      lambda { User.create_with_omniauth([]) }.must_raise TypeError
    end
  end
end
