Sequel.migration do
  up do
    create_table :information do
      primary_key :id
      String :title
      String :label
      String :name
      String :body
    end
  end

  down do
    drop_table :information
  end
end
