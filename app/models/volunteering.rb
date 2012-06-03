class Volunteering < ActiveRecord::Base
  belongs_to :resume

  # validations
  validates :organization, :start_date, :end_date, presence: true
end
