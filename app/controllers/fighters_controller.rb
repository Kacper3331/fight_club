class FightersController < ApplicationController
  def new
    @fighter = Fighter.new
  end

  def show
    @fighter_info = Fighter.find_by(id: params[:id])
    @skills = Skill.where(fighter_id: params[:id])
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

  def fighter_params
    params.require(:fighter).permit(:firstname, :lastname, :description, skills_attributes: [:id, :name, :level, :_destroy])
  end
end
