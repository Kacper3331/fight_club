class Fighter < ActiveRecord::Base
  belongs_to :fight

  has_many :skills, dependent: :delete_all

  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_presence :avatar

  validates :skills, presence: { message: 'You need to add skills' }

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true

  validates :description,
    presence: false

    scope :add_exp_points, -> (fighter_info, points) { fighter_info.update(exp_points: fighter_info.exp_points + points) }

    scope :remove_data, -> (fighter_id) { Fighter.where(id: fighter_id).delete_all }

    scope :count_fights, -> (count_wins, count_loses) { count_wins + count_loses }

    scope :averange_fights, -> (count_wins, count_loses) { count_wins / count_loses }

  def self.strongest_attack(fighter_id)
    winner_attack = Result.where(winner_id: fighter_id).maximum(:winner_attack)
    loser_attack = Result.where(loser_id: fighter_id).maximum(:loser_attack)
    max_winner_attack = winner_attack.nil? ? 0 : winner_attack
    max_loser_attack = loser_attack.nil? ? 0 : loser_attack
    if max_winner_attack > max_loser_attack
      max_winner_attack
    else
      max_loser_attack
    end
  end

  def self.weakest_attack(fighter_id)
    winner_attack = Result.where(winner_id: fighter_id).minimum(:winner_attack)
    loser_attack = Result.where(loser_id: fighter_id).minimum(:loser_attack)
    min_winner_attack = winner_attack.nil? ? 0 : winner_attack
    min_loser_attack = loser_attack.nil? ? 0 : loser_attack
    if min_winner_attack < min_loser_attack
      min_winner_attack
    else
      min_loser_attack
    end
  end
end
