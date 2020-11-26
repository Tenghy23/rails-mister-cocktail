class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail #assign instance of cocktail to dose
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = cocktail
    @dose.save

    if @dose.save

    else
      # borrowing the new page and showing it
      render :new
    end
    redirect_to cocktail_path(cocktail)
  end

  def destroy
  
  end

  private

  def doses_params
    # :dose refers to key in params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
