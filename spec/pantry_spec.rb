require 'rspec'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

describe Pantry do

  before do
    @pantry = Pantry.new
    @cheese = Ingredient.new("Cheese", "C", 50)
    @mac = Ingredient.new("Macaroni", "oz", 200)
    @mac_and_cheese = Recipe.new("Mac and Cheese")
    @mac_and_cheese.add_ingredient(@cheese, 2)
    @mac_and_cheese.add_ingredient(@mac, 8)
  end

  it "exists" do
    expect(@pantry).to be_a(Pantry)
  end

  it "has no stock by defalt" do
    expect(@pantry.stock).to eq({})
  end

  it "is able to restock" do
    expect(@pantry.stock_check(@cheese)).to eq(0)
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    expect(@pantry.stock_check(@cheese)).to eq(15)
  end

  it "can tell if the pantry has ingredients for recipes" do
    expect(@pantry.enough_ingredients_for?(@mac_and_cheese)).to be false
    @pantry.restock(@cheese, 5)
    @pantry.restock(@cheese, 10)
    expect(@pantry.enough_ingredients_for?(@mac_and_cheese)).to be false
    @pantry.restock(@mac, 8)
    expect(@pantry.enough_ingredients_for?(@mac_and_cheese)).to be true
  end

end
