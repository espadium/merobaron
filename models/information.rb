class Information < Sequel::Model
  many_to_many :items

end
