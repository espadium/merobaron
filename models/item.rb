class Item < Sequel::Model
  many_to_one  :question
  many_to_many :informations
  many_to_many :submissions
end
