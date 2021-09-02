class Project < ApplicationRecord
  belongs_to :contractor
  belongs_to :genre
  has_many :project_musicians
  has_many :musicians, through: :project_musicians
  has_many :instruments, through: :musicians
  accepts_nested_attributes_for :instruments

  def self.projects_by_instrument(instrument_name)
    self.all.select {|project| project.musicians_needed.includes?(instrument_name)}
  end

  def book_musician(musician)
    if self.budget >= musician.pay_rate
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
