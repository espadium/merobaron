Sequel.migration do
  up do
    create_table :submissions do
      primary_key :id
      String :lat
      String :long
      Integer :station_number
      DateTime :happend_at
    end
  end

  down do
    drop_table :submissions
  end
end
