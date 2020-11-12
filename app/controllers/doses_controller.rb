class DosesController < ApplicationController
  def new
    @dose = Dose.new
  end

  def create
    # raise
    @dose = Dose.new(new_dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to new_dose_path(@dose)
    else
      render :new
    end
  end

  def destroy
    @dose = Review.find(params[:id])
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  private # strong params

  def dose_params
    params.require(:dose).permit(:description)
  end
end
