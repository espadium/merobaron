Admin.controllers :questions do

  get :index do
    @questions = Question.all
    render 'questions/index'
  end

  get :new do
    @question = Question.new
    render 'questions/new'
  end

  post :create do
    @question = Question.new(params[:question])
    if (@question.save rescue false)
      if params[:options]
        params[:options].each do |option|
          option = Item.new(option.merge({question_id: @question.id}))
          option.save
        end
      end
      flash[:notice] = 'Question was successfully created.'
      redirect url(:questions, :edit, :id => @question.id)
    else
      render 'questions/new'
    end
  end

  get :edit, :with => :id do
    @question = Question[params[:id]]
    render 'questions/edit'
  end

  put :update, :with => :id do
    @question = Question[params[:id]]
    if @question.modified! && @question.update(params[:question])

      params[:options].each do |option|
        if option["id"].nil?
          new_options = option.merge({question_id: params[:id]}).delete_if{|k,v| k==:id}
          option = Item.new(new_options)
          option.save
        else
          item = Item[option["id"].to_i]
          item.update(option.delete_if{|k,v| k == "id" })
        end
      end

      flash[:notice] = 'Question was successfully updated.'
      redirect url(:questions, :edit, :id => @question.id)
    else
      render 'questions/edit'
    end
  end

  delete :destroy, :with => :id do
    question = Question[params[:id]]
    if question.destroy
      flash[:notice] = 'Question was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Question!'
    end
    redirect url(:questions, :index)
  end
end
