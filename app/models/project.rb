class Project < ActiveRecord::Base
  belongs_to :resume

  # validations
  validates :project_title, presence: true
   
end
