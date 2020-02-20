class DosesController < ApplicationController
  before_action :cocktail_id, only: [:new, :create]
  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy!
    redirect_to cocktails_path
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def cocktail_id
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
