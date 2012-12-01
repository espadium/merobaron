Sequel.migration do
  change do
    create_table :items_submissions do |t|
      foreign_key :item_id
      foreign_key :submission_id
    end
  end
end
