require('spec_helper')

describe(Category) do
  describe("#recipes") do
    it("should return the recipes that belong to the desired categories") do
      test_category1 = Category.create({:name => "Spicy"})
      test_category2 = Category.create({:name => "Thai"})
      test_category3 = Category.create({:name => "Sweet"})
      test_ingredient = Ingredient.create({:name => "Egg"})
      test_recipe1 = Recipe.create({:name => "Pad Thai", :prep => "cook noodles", :rating => 5})
      test_recipe2 = Recipe.create({:name => "Thai Rice", :prep => "cook rice", :rating => 5})
      test_recipe1.update({:ingredient_ids => test_ingredient.id(), :category_ids => test_category2.id()})
      test_recipe2.update({:ingredient_ids => test_ingredient.id(), :category_ids => test_category2.id()})
      expect(test_category2.recipes()).to(eq([test_recipe1, test_recipe2]))
    end
  end
end
