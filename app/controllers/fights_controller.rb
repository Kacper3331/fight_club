class FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)
    first_fighter_id = fight_params[:first_fighter_id].to_i
    second_fighter_id = fight_params[:second_fighter_id].to_i
    Result.create_result(first_fighter_id, second_fighter_id)
    Fight.add_result_id(@fight, Result.last.id)

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
