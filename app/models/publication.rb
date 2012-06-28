class Publication < ActiveRecord::Base
  belongs_to :resume

  # validations
  validates :title, :description, :date, presence: true
end
