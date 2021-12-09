class ShoppingListsController < ApplicationController
  def index
    @recipe = Recipe.where(id: params[:id]).includes(:recipe_foods).take
    @total = @recipe.recipe_foods.map(&:total_price).sum
  end
end