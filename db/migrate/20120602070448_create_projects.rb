class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_title
      t.integer :resume_id
      t.string :start_date
      t.string :end_date
      t.string :url
      t.text :description

      t.timestamps
    end
  end
end
