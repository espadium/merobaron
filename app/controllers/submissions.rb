require 'json'
Merobaron.controllers :submissions do

  post :create, "/submissions/new" do
    @submission = Submission.new(params[:submission])
    
    if @submission.save
      items = params.select! { |key, val| key if key.to_s.include?("item_") && !val.blank? }
        
      items.each do |key, item_id|
        item = Item[item_id]
        @submission.add_item(item) unless item.nil?
        @submission.save
      end

      redirect "/submissions/#{@submission.id}"
    else
      redirect :back
    end
  end

  get :show, "/submissions/:id" do
    @submission = Submission[params[:id]]
    redirect "/" if @submission.nil?

    haml :'/submissions/show'
  end

  get :submissions_by_station, "/submissions/:station_number/:start_date/:end_date" do
    if params[:station_number].blank? || params[:station_number].to_i > 20 || params[:station_number].to_i < 1
      status 403
      return "The station number is not valid or not present"
    end
    if params[:start_date].blank? || params[:end_date].blank?
      status 403
      return "Either the start or end date is not properly formated or not present"
    end
    
    @submissions = Submission.by_station(params[:station_number], params[:start_date].to_time, params[:end_date].to_time)
    @submissions.to_json
  end

  get :submissions_by_date, "/submissions/:start_date/:end_date" do
    if params[:start_date].blank? || params[:end_date].blank?
      status 403
      return "Either the start or end date is not properly formated or not present"
    end
    
    @submissions = Submission.by_date(params[:start_date].to_time, params[:end_date].to_time)
    @submissions.to_json
  end

end
