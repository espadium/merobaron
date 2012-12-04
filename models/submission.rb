require 'json'

class Submission < Sequel::Model
  many_to_many :items

  def self.by_station(station_number, start_date, end_date)
    where( station_number: station_number, happened_at: start_date..end_date ).all
  end

  def self.by_date(start_date, end_date)
    where( happened_at: start_date..end_date ).all
  end

  def has_item?(item_name)
    items.map(&:name).includes?(item_name)
  end

  def informations
    self.items.map(&:informations).flatten
  end

  def to_json
    {
      lat: lat,
      long: long,
      statation_number: station_number,
      hapepend_at: happened_at,
      items: items_to_json
    }
  end

  def items_to_json
    items.map { |i| { title: i.title, name: i.name, label: i.label, suggestion: i.suggestion } }
  end
end
