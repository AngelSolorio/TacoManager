require "test_helper"

describe Menu do
  fixtures :menus
  fixtures :dishes
  fixtures :establishments

  before do
    @menu_valid = menus(:menu_1)
    @menu_invalid = Menu.new
  end

  context "Validations" do
    it "must be valid" do
      puts ">>>>>>>>> #{@menu_valid.errors.inspect}"
      @menu_valid.valid?.must_equal true
    end

    it "must be invalid" do
      @menu_invalid.valid?.must_equal false
      @menu_invalid.errors.size.must_equal 2
      @menu_invalid.errors[:dish_is].wont_be_nil
      @menu_invalid.errors[:establishment_id].wont_be_nil
    end
  end

  context "Relations" do
    it "must link a dish and an establishment" do
      @menu = Menu.new
      @menu.dish = dishes(:dish_2)
      @menu.establishment = establishments(:establishment_2)

      @menu.valid?.must_equal true
      @menu.dish.must_be_same_as dishes(:dish_1)
      @menu.establishment.must_equal establishments(:establishment_2)
    end

    it "must be unique" do
      @menu1 = Menu.new
      @menu1.dish = dishes(:dish_1)
      @menu1.establishment = establishments(:establishment_1)
      @menu1.save

      @menu2 = Menu.new
      @menu2.dish = dishes(:dish_1)
      @menu2.establishment = establishments(:establishment_1)

      @menu2.valid?.must_equal false
      @menu2.errors.size.must_equal 2
      @menu2.errors[:dish_is].wont_be_nil
      @menu2.errors[:establishment_id].wont_be_nil
    end
  end

end
