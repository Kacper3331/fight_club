class StatisticsController < ApplicationController
  helper_method :count_fights

  def index
    @fighters = Fighter.all
  end

  private
  def count_fights(fighter_id)
    count_wins = Result.where(winner_id: fighter_id).count
    count_loses = Result.where(loser_id: fighter_id).count
    @count_fights = Fighter.count_fights(count_wins, count_loses)
  end
end
