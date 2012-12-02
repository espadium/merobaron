# Helper methods defined here can be accessed in any controller or view in the application

Merobaron.helpers do
  def input_text(options)
    haml :'helpers/_input_text', locals: { options: options.merge({ type: "text" }) }
  end
  def text_area(options)
    haml :'helpers/_text_area', locals: { options: options.merge({ type: "text" }) }
  end
end
