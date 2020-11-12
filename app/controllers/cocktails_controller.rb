class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(params[:cocktail])
    @cocktail.save

    redirect_to cocktail_path(@cocktail)
  end

  private # strong params

  def cocktails_params
    params.require(:cocktail).permit(:name)
  end
end
