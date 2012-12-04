Merobaron.controllers :main do

  get :index, map: "/" do
    questions = Question.all
    haml :'index', locals: { questions: questions }
  end

  get :mapa, map: "/mapa" do
    haml :'map/index'
  end

end
