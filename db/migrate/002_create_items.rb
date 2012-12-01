Sequel.migration do
  up do
    create_table :items do
      primary_key :id
      String :title
      String :label
      String :name
    end
  end

  down do
    drop_table :items
  end
end
