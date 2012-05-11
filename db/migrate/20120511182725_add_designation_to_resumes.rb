class AddDesignationToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :designation, :string

  end
end
