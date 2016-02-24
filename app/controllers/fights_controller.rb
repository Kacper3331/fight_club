class FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)
    if @fight.save
      redirect_to new_fights_path, notice: 'DUEL END!'
    else
      render :new
    end
  end

  private
  def fight_params
    params.require(:fight).permit(:first_fighter_id, :second_fighter_id)
  end
end
