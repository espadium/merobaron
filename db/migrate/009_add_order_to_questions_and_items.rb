Sequel.migration do
  change do
    add_column :questions, :order, :integer
    add_column :items, :order, :integer
  end
end
