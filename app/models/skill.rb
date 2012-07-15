class Skill < ActiveRecord::Base
  belongs_to :resume
  validates :skill, presence: true
  default_scope order('position asc')
end
