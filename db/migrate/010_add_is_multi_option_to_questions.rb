Sequel.migration do
  change do
    add_column :questions, :is_multi_option?, :boolean, default: false
  end
end
