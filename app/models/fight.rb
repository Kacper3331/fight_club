class Fight < ActiveRecord::Base
  has_many :fighters

  scope :select_skill, -> (fighter_id) { Skill.where(fighter_id: fighter_id).sample }

  scope :fighter_info, -> (fighter_id) { Fighter.where(id: fighter_id).first }
  scope :calculate_attack, -> (skill_level, exp_points) { (skill_level * rand(0.1..1.0) * exp_points).to_i }

  scope :add_result_id, -> (fight, result_id) { fight.result_id = result_id  }
end
