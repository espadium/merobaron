Admin.controllers :information do

  before do
    @question_options = Question.order(:title).map{ |question| [question.label, question.items.map { |item| [item.label, item.id] } ] }
  end

  get :index do
    @information = Information.all
    render 'information/index'
  end

  get :new do
    @information = Information.new
    render 'information/new'
  end

  post :create do
    @information = Information.new(params[:information])

    if (@information.save rescue false)
      @information.remove_all_items
      items = params.select! { |key, val| key if key.to_s.include?("item_") && !val.blank? }
      items.each do |key, val|
        item = Item[val]
        @information.add_item(item) 
      end

      @information.save

      flash[:notice] = 'Information was successfully created.'
      redirect url(:information, :edit, :id => @information.id)
    else
      render 'information/new'
    end
  end

  get :edit, :with => :id do
    @information = Information[params[:id]]
    render 'information/edit'
  end

  put :update, :with => :id do
    @information = Information[params[:id]]
    if @information.modified! && @information.update(params[:information])
      @information.remove_all_items
      items = params.select! { |key, val| key if key.to_s.include?("item_") && !val.blank? }
      items.each do |key, val|
        item = Item[val]
        @information.add_item(item) 
      end

      @information.save

      flash[:notice] = 'Information was successfully updated.'
      redirect url(:information, :edit, :id => @information.id)
    else
      render 'information/edit'
    end
  end

  delete :destroy, :with => :id do
    information = Information[params[:id]]
    if information.destroy
      flash[:notice] = 'Information was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Information!'
    end
    redirect url(:information, :index)
  end
end
