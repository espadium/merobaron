class Submission < Sequel::Model
  many_to_many :items
end
