class CocktailsController < ApplicationController

  def index
    @cocktails=Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.create(strong_params)
    @cocktail.save!
    redirect_to cocktail_path(@cocktail.id)
  end

  private

  def strong_params
    params.require(:cocktail).permit(:name)
  end

end
