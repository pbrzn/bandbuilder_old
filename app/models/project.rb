class Project < ApplicationRecord
  belongs_to :contractor
  belongs_to :genre
  has_many :project_instruments
  has_many :instruments, through: :project_instruments
  has_many :project_musicians
  has_many :musicians, through: :project_musicians
  accepts_nested_attributes_for :instruments

  def open_instrument_slots
    musician_instruments = self.musicians.map {|musician| musician.instrument_name }
    self.instruments.select {|instrument| !musician_instruments.include?(instrument.name)}
  end
  
  def self.projects_by_instrument(instrument_id)
    i = Instrument.find_by(id: instrument_id)
    if !i.nil?
      self.all.select {|project| project.open_instrument_slots.include?(i)}
    else
      self.all.select {|project| project.open_instrument_slots.include?(name: instrument_name)}
    end
  end

  def book_musician(musician)
    if self.budget < musician.pay_rate && self.open_instrument_slots.include?(musician.instrument)
      errors.add(:budget, "is insufficient to pay musician.")
    elsif self.musicians.include?(musician)
      errors.add(:musicians, "#{musician.name} has already been added to #{self.title}'s lineup.")
    elsif !self.open_instrument_slots.include?(musician.instrument)
      errors.add(:instruments, "has already been staffed for this project.")
    else
      self.musicians << musician
      self.update!(budget: (self.budget -= musician.pay_rate))
      musician.update(account: (musician.account += musician.pay_rate))
      self.save!
      "#{musician.name} has been added to #{self.title}!"
    end
  end
end
