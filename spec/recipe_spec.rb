require 'rspec'
require './lib/ingredient'
require './lib/recipe'

describe Recipe do

    before(:all) do
      @cheese = Ingredient.new("Cheese", "oz", 50)
      @mac = Ingredient.new("Macaroni", "oz", 200)
      @mac_and_cheese = Recipe.new("Mac and Cheese")
    end

    it "exists" do
      expect(@mac_and_cheese).to be_a(Recipe)
    end

    it "has a name" do
      expect(@mac_and_cheese.name).to eq("Mac and Cheese")
    end

    it "can add ingredients" do
      expect(@mac_and_cheese.ingredients).to eq({})
      @mac_and_cheese.add_ingredient(@cheese, 2)
      @mac_and_cheese.add_ingredient(@mac, 8)

      expect(@mac_and_cheese.ingredients).to eq({
        @cheese => 2
        @mac => 8
      })
    end

    it "can check needed amounts" do
      @mac_and_cheese.add_ingredient(@cheese, 2)
      @mac_and_cheese.check_amount("Cheese").to eq("2 oz")

      @mac_and_cheese.add_ingredient(@mac, 8)
      @mac_and_cheese.check_amount("Macaroni").to eq("8 oz")
    end

    it "can find total calories" do
      expect(@mac_and_cheese.total_calories).to eq(0)

      @mac_and_cheese.add_ingredient(@cheese, 2)
      @mac_and_cheese.add_ingredient(@mac, 8)

      expect(@mac_and_cheese.total_calories).to eq(1700)
    end

end
