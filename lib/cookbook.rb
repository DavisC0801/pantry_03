class CookBook

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    summary_hash = {:name => recipe.name,
    :details => {:ingredients => [], :total_calories => recipe.total_calories} }

    ordered_recipe = recipe.ingredients.to_a.sort_by do |ingredient|
      ingredient[0].calories * ingredient[1]
    end

    recipe.ingredients.each do |ingredient|
      input = ordered_recipe.pop
      summary_hash[:details][:ingredients] << {
        :ingredient => input[0].name,
        :amount => recipe.check_amount(input[0])
      }
    end
    @recipes << summary_hash
  end

  def summary
    @recipes
  end

end
