Sequel.migration do
  change do
    add_column :items, :question_id, :integer
  end
end
