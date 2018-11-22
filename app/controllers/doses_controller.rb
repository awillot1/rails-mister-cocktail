class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  # def destroy
  #   @dose.destroy
  #   respond_to do |format|
  #     format.html { redirect_to cocktail_url, notice: "Dose was successfully destroyed." }
  #     format.json { head :no_content}
  #   end
  # end

  def destroy
    @dose.destroy
  end

  private

  def set_dose
   @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:id, :description, :ingredient_id)
  end
end
