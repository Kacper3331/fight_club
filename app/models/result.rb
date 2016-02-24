class Result < ActiveRecord::Base
  def self.select_skill(fighter_id)
    Fight.select_skill(fighter_id)
  end

end
