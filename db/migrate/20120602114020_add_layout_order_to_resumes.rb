class AddLayoutOrderToResumes < ActiveRecord::Migration
  def change
    add_column :resumes, :layout_order, :string, default: "educations experiences skills projects publications volunteerings"

  end
end
