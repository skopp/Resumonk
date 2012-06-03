class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.string :publisher
      t.string :date
      t.string :author
      t.text :description
      t.integer :resume_id

      t.timestamps
    end
  end
end
