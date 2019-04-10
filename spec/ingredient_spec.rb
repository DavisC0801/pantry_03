require 'rspec'
require './lib/ingredient'

describe Ingredient do

  before(:all) do
    @cheese = Ingredient.new("Cheese", "oz", 200)
  end

  it "exists" do
    expect(@cheese).to be_a(Ingredient)
  end

  it "has a name" do
    expect(@cheese.name).to eq("Cheese")
  end

  it "has a unit" do
    expect(@cheese.unit).to eq("Cheese")
  end

  it "has a calorie count" do
    expect(@cheese.calories).to eq(200)
  end

end
