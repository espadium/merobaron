Merobaron.controllers :main do

  get :index, map: "/" do
    questions = Question.all
    haml :'index', locals: { questions: questions }
  end

  get :mapa, map: "/mapa" do
    haml :'map/index'
  end

  get :api, map: "/api" do
    haml :'api/static'
  end

  get :notifications, map: '/alertas' do
    haml :'notifications/register'
  end

end
