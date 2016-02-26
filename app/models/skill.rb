class Skill < ActiveRecord::Base
  belongs_to :fighter, dependent: :destroy

  validates :name,
    presence: true

  validates :level,
    presence: true
end
