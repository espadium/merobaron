Merobaron.controllers :informations do
  @@messages = {
          update_error: "Error while updating",
        update_success: "Updated successfully",
    resource_not_found: "This resource has been moved or never existed"
  }

  get :index, map: "/informations" do
    @informations = Information.order(:title)
    haml :'informations/index'
  end

  get :edit, map: "/information/:id/edit" do
    @information = Information[params[:id]]
    redirect '/', 301, error: @@messages[:resource_not_found] unless @information

    haml :'informations/edit'
  end
  
  put :update, map: "/information/:id" do
    @information = Information[params[:id]]
    redirect '/', 301, error: @@messages[:resource_not_found] unless @information

    if @information.update_attributes(params[:information])
      redirect "/informations", 200, notice: @@messages[:update_success] 
    else
      redirect "/informations", 403, error: @@messages[:update_error]
    end
  end
end
