class Submission < Sequel::Model
  many_to_many :items

  def self.by_station(station_number, start_date, end_date)
    where( station_number: station_number, happened_at: start_date..end_date ).all
  end

  def self.by_date(start_date, end_date)
    where( happened_at: start_date..end_date ).all
  end

  def to_json(opts = {})
    opts.merge( {:include => { items: { only: label } } } )
    super(opts)
  end

  def has_item?(item_name)
    items.map(&:name).includes?(item_name)
  end

  def informations
    self.items.map(&:informations).flatten
  end
end
