class Result < ActiveRecord::Base
  def self.add_data(winner_id, loser_id, winner_skill, loser_skill, winner_attack, loser_attack)
    result = Result.new
    result.winner_id = winner_id
    result.loser_id = loser_id
    result.winner_skill_id = winner_skill.id
    result.loser_skill_id = loser_skill.id
    result.winner_attack = winner_attack
    result.loser_attack = loser_attack
    result.save
    Fighter.add_exp_points(fighter_info(winner_id), 10)
    Fighter.add_exp_points(fighter_info(loser_id), 5)
  end

  def self.select_skill(fighter_id)
    Fight.select_skill(fighter_id)
  end

  def self.fighter_info(fighter_id)
    Fight.fighter_info(fighter_id)
  end

  def self.fighter_attack(skill_level, exp_points)
    Fight.calculate_attack(skill_level, exp_points)
  end
end
