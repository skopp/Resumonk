class Volunteering < ActiveRecord::Base
  belongs_to :resume

  # validations
  validates :organization, presence: true
end
