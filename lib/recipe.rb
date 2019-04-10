class Recipe

  attr_reader :name, :ingredients

  def initialize(name)
    @name = name
    @ingredients = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients[ingredient] = amount
  end

  def check_amount(ingredient)
    return nil if !@ingredients.has_key?(ingredient)
    return "#{ingredients[ingredient]} #{ingredient.unit}"
  end

  def total_calories
    return 0 if @ingredients.empty?
    total_count = 0
    ingredients.each_pair do |key, value|
      total_count += (key.calories * value)
    end
    return total_count
  end

end
