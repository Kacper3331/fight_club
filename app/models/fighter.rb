class Fighter < ActiveRecord::Base
  has_many :skills
  accepts_nested_attributes_for :skills, reject_if: :all_blank, allow_destroy: true

  validates :skills, presence: { message: 'You need to add skills' }

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true

  validates :description,
    presence: false

    scope :count_skills, ->(skills_attributes) { skills_attributes.keys.count }
end
