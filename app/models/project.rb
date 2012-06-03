class Project < ActiveRecord::Base
  belongs_to :resume

  # validations
  validates :project_title, :description, :start_date, :end_date, presence: true
   
end
