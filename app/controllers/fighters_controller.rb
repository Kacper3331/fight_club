class FightersController < ApplicationController
  helper_method [:strongest_skill_attack, :weakest_skill_attack]

  def new
    @fighter = Fighter.new
  end

  def show
    @fighter_info = Fighter.find_by(id: params[:id])
    @skills = Skill.where(fighter_id: params[:id])
    @count_wins = Result.where(winner_id: params[:id]).count
    @count_loses = Result.where(loser_id: params[:id]).count
    @count_fights = Fighter.count_fights(@count_wins, @count_loses)
    @win_percent = @count_wins > 0 ||  @count_fights > 0 ? Fighter.win_percent(@count_wins, @count_fights) : 0
    @strongest_attack = Fighter.strongest_attack(params[:id])
    @weakest_attack = Fighter.weakest_attack(params[:id])
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      #to count skills data should have skills_attributes
      if !fighter_params[:skills_attributes].nil?
        count_skills = Skill.where(fighter_id: Fighter.last.id).count
        count_uniq_skills = Skill.select(:name).where(fighter_id: Fighter.last.id).uniq.count
        #check if amount of skills is greater than or eq 3 and less or eq than 9
        if count_skills >= 3 &&  count_skills <= 9
          #check if skill names are unique
          if count_skills == count_uniq_skills
            redirect_to root_path, notice: "New fighter is ready to battle!"
          else
            Fighter.remove_data(Fighter.last.id)
            redirect_to new_fighter_path, notice: 'Your skill names have to be unique!'
          end
        else
          Fighter.remove_data(Fighter.last.id)
          redirect_to new_fighter_path, notice: 'You need at least 3 and no more than 9 skills'
        end
      else
        render :new
      end
    else
      flash.now[:notice] = 'You have to add skills'
      render :new
    end
  end


  def strongest_skill_attack(skill_id)
    winner_attack = Result.where(winner_skill_id: skill_id).maximum(:winner_attack)
    loser_attack =  Result.where(loser_skill_id: skill_id).maximum(:loser_attack)
    winner_at = winner_attack.nil? ? 0 : winner_attack
    loser_at = loser_attack.nil? ? 0 : loser_attack
    if winner_at > loser_at
      winner_at
    else
      loser_at
    end
  end

  def weakest_skill_attack(skill_id)
    winner_attack = Result.where(winner_skill_id: skill_id).minimum(:winner_attack)
    loser_attack =  Result.where(loser_skill_id: skill_id).minimum(:loser_attack)
    winner_at = winner_attack.nil? ? 0 : winner_attack
    loser_at = loser_attack.nil? ? 0 : loser_attack
    if winner_at > loser_at && loser_at != 0
      loser_at
    else
      winner_at
    end
  end

  private
  def fighter_params
    params.require(:fighter).permit(:firstname, :lastname, :avatar, :description, skills_attributes: [:id, :name, :level, :_destroy])
  end
end
