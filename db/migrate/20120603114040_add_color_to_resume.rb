class AddColorToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :color, :string
  end
end
