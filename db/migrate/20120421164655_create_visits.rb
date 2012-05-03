class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :ip
      t.string :country
      t.integer :resume_id

      t.timestamps
    end
  end
end
