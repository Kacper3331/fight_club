class WelcomeMailer < ApplicationMailer
  default from: "from@example.com"

  def welcome(fighter)
    @fighter = fighter
    @skills = Skill.where(fighter_id: @fighter.id)
    @job = Job.where(id: @fighter.job_id).first
    mail(to: 'denebv201@gmail.com', subject: 'Welcome to our fighting World!')
  end
end
