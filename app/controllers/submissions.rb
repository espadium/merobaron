Merobaron.controllers :submissions do
  post :create, "/submissions" do
    @submission = Submission.new(params[:submission])
    
    if @submission.save
      items = params.select! { |key, val| key if key.to_s.include?("item_") && !val.blank? }
        
      items.each do |key, item_id|
        item = Item[item_id]
        @submission.add_item(item) unless item.nil?
        @submission.save
      end
      "OK"
    else
      "NOK"
    end
  end
end
