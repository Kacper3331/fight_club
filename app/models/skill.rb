class Skill < ActiveRecord::Base
  belongs_to :fighter

  validates :name,
    presence: true

  validates :level,
    presence: true
end
