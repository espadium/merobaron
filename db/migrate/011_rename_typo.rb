Sequel.migration do
  change do
    rename_column :submissions, :happend_at, :happened_at
  end
end
