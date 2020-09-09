class Medicine < ApplicationRecord
	before_save { self.name = self.name.upcase }
	before_save { active_substance.upcase! } 
	before_save { self.name = "#{self.name} #{self.unit_gram} #{self.unit}"}
	
	validates :name, presence: true, length: { maximum: 49 }
	validates :barcode, numericality: { only_integer: true } , presence: true, uniqueness: { case_sensitive: false }
	validates :active_substance, presence: true, length: { maximum: 49 }
	validates :unit_gram, :numericality => true , presence: true
	validates :unit, presence: true
	validates :tva, presence: true

	has_many :stocks
	has_many :bls, through: :stocks
	has_one :tier
end
