class FightersController < ApplicationController
  def new
    @fighter = Fighter.new
  end

  def show
    @fighter_info = Fighter.find_by(id: params[:id])
    @skills = Skill.where(fighter_id: params[:id])
    @count_wins = Result.where(winner_id: params[:id]).count
    @count_loses = Result.where(loser_id: params[:id]).count
    @count_fights = Fighter.count_fights(@count_wins, @count_loses)
    @averange = @count_wins > 0 ||  @count_loses > 0 ? Fighter.averange_fights(@count_wins, @count_loses) : 0
    @strongest_attack = @count_wins > 0 ||  @count_loses > 0 ? strongest_attack(params[:id]) : 0
    @weakest_attack = @count_wins > 0 ||  @count_loses > 0  ? weakest_attack(params[:id]) : 0
  end

  def create
    @fighter = Fighter.new(fighter_params)

    if @fighter.save
      #to count skills data should have skills_attributes
      if !fighter_params[:skills_attributes].nil?
        #check if amount of skills is greater than or eq 3 and less or eq than 9
        count_skills = Skill.where(fighter_id: Fighter.last.id).count
        if count_skills >= 3 &&  count_skills <= 9
          redirect_to root_path, notice: "New fighter is ready to battle!"
        else
          Fighter.remove_data(Fighter.last.id)
          redirect_to new_fighter_path, notice: 'You need at least 3 and no more than 9 skills'
        end
      else
        flash.now[:notice] = @fighter.errors[:skills].first
        render :new
      end
    else
      flash.now[:notice] = @fighter.errors[:skills].first
      render :new
    end
  end

  private

  def strongest_attack(fighter_id)
    max_winner_attack = Result.where(winner_id: fighter_id).maximum(:winner_attack)
    max_loser_attack = Result.where(loser_id: fighter_id).maximum(:loser_attack)
    if max_winner_attack > max_loser_attack
      max_winner_attack
    else
      max_loser_attack
    end
  end

  def weakest_attack(fighter_id)
    min_winner_attack = Result.where(winner_id: fighter_id).minimum(:winner_attack)
    min_loser_attack = Result.where(loser_id: fighter_id).minimum(:loser_attack)
    if min_winner_attack < min_loser_attack
      min_winner_attack
    else
      min_loser_attack
    end
  end

  def fighter_params
    params.require(:fighter).permit(:firstname, :lastname, :description, skills_attributes: [:id, :name, :level, :_destroy])
  end
end
