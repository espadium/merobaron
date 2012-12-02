class Item < Sequel::Model
  many_to_one  :question
  many_to_many :informations, join_table: :informations_items
  many_to_many :submissions
end
