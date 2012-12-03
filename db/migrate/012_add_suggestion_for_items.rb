Sequel.migration do
  change do
    add_column :items, :suggestion, String
  end
end
