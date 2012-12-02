class Information < Sequel::Model(:informations)
  many_to_many :items, join_table: :informations_items
end
