class Fight < ActiveRecord::Base
  has_many :fighters

  scope :select_skill, -> (fighter_id) { Skill.where(fighter_id: fighter_id).sample }

  scope :fighter_info, -> (fighter_id) { Fighter.where(id: fighter_id).first }
end
