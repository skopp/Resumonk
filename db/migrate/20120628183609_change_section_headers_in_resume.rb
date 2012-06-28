class ChangeSectionHeadersInResume < ActiveRecord::Migration
  def change
    add_column :resumes, :educations_header, :string, default: "Education"
    add_column :resumes, :experiences_header, :string, default: "Experience"
    add_column :resumes, :skills_header, :string, default: "Skills"
    add_column :resumes, :projects_header, :string, default: "Projects"
    add_column :resumes, :publications_header, :string, default: "Publications"
    add_column :resumes, :volunteerings_header, :string, default: "Volunteering"
  end
end
