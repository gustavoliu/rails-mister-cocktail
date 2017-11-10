class DosesController < ApplicationController
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to_cocktail
    else
      redirect_to_cocktail
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to_cocktail
  end

  private
  def redirect_to_cocktail
    redirect_to cocktail_path(@cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
