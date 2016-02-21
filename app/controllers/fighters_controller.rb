class FightersController < ApplicationController
  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      redirect_to root_path, notice: "New fighter is ready to battle!"
    else
      render :new
    end
  end

  private

  def fighter_params
    params.require(:fighter).permit(:firstname, :lastname, :description, skills_attributes: [:id, :name, :level, :_destroy])
  end
end
