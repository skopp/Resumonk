module ResumesHelper
  
  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to(name, "#", class: "remove_field button red radius small right")
  end
  
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
         fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
           render(association.to_s.singularize, :f => builder)
         end
    
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")", class: "button nine columns right radius add_fields")
    
  end
  
  def designation(resume)
    if !resume.designation.nil?
      resume.designation
    elsif resume.experiences.any?
      resume.experiences.first.designation
    else
      ""
    end
  end
  
  
  def email(resume)
    if !resume.email.blank?
      resume.email
    else
      current_user.email
    end
  end
  
end
