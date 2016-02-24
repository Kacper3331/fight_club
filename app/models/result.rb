class Result < ActiveRecord::Base
  def self.select_skill(fighter_id)
    Fight.select_skill(fighter_id)
  end

  def self.fighter_info(fighter_id)
    Fight.fighter_info(fighter_id)
  end

end
