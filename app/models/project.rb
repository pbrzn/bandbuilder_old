class Project < ApplicationRecord
  belongs_to :contractor
  belongs_to :genre
  has_many :project_instruments
  has_many :instruments, through: :project_instruments
  has_many :musicians, through: :instruments
  accepts_nested_attributes_for :instruments

  def open_instrument_slots
    musician_instruments = self.musicians.map {|musician| musician.instrument_name }
    self.instruments.select {|instrument| !musician_instruments.include?(instrument.name)}
  end

  def self.projects_by_instrument(instrument_name)
    i = Instrument.find_by(name: instrument_name)
    if !i.nil?
      self.all.select {|project| project.open_instrument_slots.include?(i)}
    else
      self.all.select {|project| project.open_instrument_slots.include?(name: instrument_name)}
    end
  end

  def book_musician(musician)
    if self.budget >= musician.pay_rate && musician.instrument
      self.musicians << musician
      self.update!(budget: (self.budget -= musician.pay_rate))
      musician.update(account: (musician.account += musician.pay_rate))
      self.save!
      "#{musician.name} has been added to #{self.title}!"
    else
      errors.add(:budget, "is insufficient to pay musician.")
    end
  end
end
