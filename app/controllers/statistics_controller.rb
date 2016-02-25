class StatisticsController < ApplicationController
  helper_method [:count_fights, :averange_wins, :strongest_attack]

  def index
    @fighters = Fighter.where('exp_points > ?', 100)
  end

  private

  def count_fights(fighter_id)
    count_wins = Result.where(winner_id: fighter_id).count
    count_loses = Result.where(loser_id: fighter_id).count
    @count_fights = Fighter.count_fights(count_wins, count_loses)
  end

  def strongest_attack(fighter_id)
    count_wins = Result.where(winner_id: fighter_id).count
    count_loses = Result.where(loser_id: fighter_id).count
    @strongest_attack = Fighter.strongest_attack(fighter_id)
  end

  def averange_wins(fighter_id)
    count_wins = Result.where(winner_id: fighter_id).count
    count_loses = Result.where(loser_id: fighter_id).count
    @averange_fights = count_wins > 0 && count_loses > 0 ? Fighter.averange_fights(count_wins, count_loses) : 0
  end
end
