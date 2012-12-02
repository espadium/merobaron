# Helper methods defined here can be accessed in any controller or view in the application

Merobaron.helpers do
  def render_information_template(information)
    ["_#{information.name}", "_information_base"].each do |template|
      return :"informations/#{template}" if check_template_file(template)
    end
  end

  def check_template_file(file_name)
    File.exists?(Padrino.root("app","views","informations", "#{file_name}.haml"))
  end
end
