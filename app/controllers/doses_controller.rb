class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail #assign instance of cocktail to dose
  end

  def create
    @dose = Dose.new(doses_params) # dose params take data from the form in create
    @cocktail = Cocktail.find(params[:cocktail_id]) # this finds the cocktail instance via id
    @dose.cocktail = @cocktail # saves the cocktail instance inside dose

    if @dose.save
      redirect_to cocktail_path(@cocktail)

    else
      # borrowing the new page and showing it
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id]) # dose id, seperate from cocktail id
    @dose.destroy

    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def doses_params
    # :dose refers to key in params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
