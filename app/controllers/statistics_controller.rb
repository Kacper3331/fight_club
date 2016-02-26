class StatisticsController < ApplicationController
  helper_method [:count_fights, :strongest_attack, :show_job]

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

  def show_job(job_id)
    @job = Job.where(id: job_id).first
    @job.name
  end
end
