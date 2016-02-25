class Result < ActiveRecord::Base
  def self.create_result(first_fighter_id, second_fighter_id)
    first_fighter_skill = select_skill(first_fighter_id)
    second_fighter_skill = select_skill(second_fighter_id)
    first_fighter_exp_points = fighter_info(first_fighter_id).exp_points.to_i
    second_fighter_exp_points = fighter_info(second_fighter_id).exp_points.to_i
    first_fighter_attack = fighter_attack(first_fighter_skill.level, first_fighter_exp_points)
    second_fighter_attack = fighter_attack(second_fighter_skill.level, second_fighter_exp_points)

    if first_fighter_attack > second_fighter_attack
      add_data(first_fighter_id, second_fighter_id, first_fighter_skill, second_fighter_skill, first_fighter_attack, second_fighter_attack)
    else
      add_data(second_fighter_id, first_fighter_id, second_fighter_skill, first_fighter_skill, second_fighter_attack, first_fighter_attack)
    end
  end

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

  def self.winner_fighter(fighter_id)
    Fight.fighter_info(fighter_id).firstname + ' ' + Fight.fighter_info(fighter_id).lastname
  end
end
