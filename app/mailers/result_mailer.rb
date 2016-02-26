class ResultMailer < ApplicationMailer
  def winner(fighter)
      @fighter = fighter
      @result = Result.where(winner_id: @fighter.id).last
      @skill = Skill.where(id: @result.winner_skill_id).first
      @skill_lost = Skill.where(id: @result.loser_skill_id).first
      @oponent = Fighter.where(id: @result.loser_id).first
      @job = Job.where(id: @oponent.job_id).first
      mail(to: @fighter.email, subject: 'Information about your last fight')
  end

  def loser(fighter)
    @fighter = fighter
    @result = Result.where(loser_id: @fighter.id).last
    @skill = Skill.where(id: @result.loser_skill_id).first
    @skill_win = Skill.where(id: @result.winner_skill_id).first
    @oponent = Fighter.where(id: @result.winner_id).first
    @job = Job.where(id: @oponent.job_id).first
    mail(to: @fighter.email, subject: 'Information about your last fight')
  end
end
