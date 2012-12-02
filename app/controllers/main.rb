Merobaron.controllers :main do
  # get :index, :map => "/foo/bar" do
  #   session[:foo] = "bar"
  #   render 'index'
  # end

  # get :sample, :map => "/sample/url", :provides => [:any, :js] do
  #   case content_type
  #     when :js then ...
  #     else ...
  # end

  # get :foo, :with => :id do
  #   "Maps to url '/foo/#{params[:id]}'"
  # end

  # get "/example" do
  #   "Hello world!"
  # end

  get :index, map: "/" do
    questions = Question.all
    haml :'index', locals: { questions: questions }
  end

  get :mapa, map: "/mapa" do
    haml :'map/index'
  end

end
