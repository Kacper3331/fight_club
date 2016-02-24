class Fight < ActiveRecord::Base
  has_many :fighters

  scope :select_skill, -> (fighter_id) { Skill.where(fighter_id: fighter_id).sample }

end
