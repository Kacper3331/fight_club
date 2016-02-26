class FightsController < ApplicationController
  def new
    @fight = Fight.new
  end

  def create
    @fight = Fight.new(fight_params)
    first_fighter_id = fight_params[:first_fighter_id].to_i
    second_fighter_id = fight_params[:second_fighter_id].to_i
    if first_fighter_id > 0 && second_fighter_id > 0
      if !(first_fighter_id == second_fighter_id)
        Result.create_result(first_fighter_id, second_fighter_id)
        Fight.add_result_id(@fight, Result.last.id)
        @winner_name = Result.winner_fighter(Result.last.winner_id)
        if @fight.save
          ResultMailer.winner(Fighter.where(id: Result.last.winner_id).first).deliver
          ResultMailer.loser(Fighter.where(id: Result.last.loser_id).first).deliver
          redirect_to new_fight_path, notice: 'DUEL END! Winner: ' + @winner_name
        else
          render :new
        end
      else
        flash.now[:notice] = 'You can\'t fight with yourself'
        render :new
      end
    else
      flash.now[:notice] = 'You need to select two fighters'
      render :new
    end
  end

  private
  def fight_params
    params.require(:fight).permit(:first_fighter_id, :second_fighter_id)
  end
end
