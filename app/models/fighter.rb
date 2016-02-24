class Fighter < ActiveRecord::Base
  belongs_to :fight

  has_many :skills, dependent: :delete_all

  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true

  validates :skills, presence: { message: 'You need to add skills' }

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true

  validates :description,
    presence: false

    scope :add_exp_points, -> (fighter_info, points) { fighter_info.update(exp_points: fighter_info.exp_points + points) }

    scope :remove_data, -> (fighter_id) { Fighter.where(id: fighter_id).delete_all }
end
