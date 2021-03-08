class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.create(strong_params)
    @dose.ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    @dose.save!

    redirect_to cocktail_path(params[:cocktail_id])
  end
  
  def destroy
    dose = Dose.find(params[:id])
    @cocktail = dose.cocktail
    dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  private

  def strong_params
    params.require(:dose).permit(:description)
  end
end
