class CreateVolunteerings < ActiveRecord::Migration
  def change
    create_table :volunteerings do |t|
      t.string :cause
      t.string :organization
      t.integer :resume_id
      t.string :start_date
      t.string :end_date
      t.text :description

      t.timestamps
    end
  end
end
