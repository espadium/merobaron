Sequel.migration do
  change do
    create_table :informations_items do
      foreign_key :information_id
      foreign_key :item_id
    end
  end
end
