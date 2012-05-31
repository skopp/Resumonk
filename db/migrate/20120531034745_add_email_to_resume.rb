class AddEmailToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :email, :string
  end
end
