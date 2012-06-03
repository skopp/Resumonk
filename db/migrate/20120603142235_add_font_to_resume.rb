class AddFontToResume < ActiveRecord::Migration
  def change
    add_column :resumes, :font, :string

  end
end
