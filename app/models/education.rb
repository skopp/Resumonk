class Education < ActiveRecord::Base
  belongs_to :resume
  
  # validations
  validates :institute_name, :degree, presence: true
  # validates :gpa, format: { with: /^[0-9]+\.[0-9]{2}$/ }, allow_blank: true
end
