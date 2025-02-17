class Stock < ApplicationRecord

	before_save { self.medicine_name = "#{self.medicine_name} #{self.ppv} DHS"}
	#The IDs are obligatory and should be enforced to ensure the integrity of the database system.
	validates :bl_id, presence: true, numericality: { greater_than: 0 }
	validates :medicine_id, presence: true, numericality: { greater_than: 0 }
	#Medicine_Qt and Qt_Sold starts as the same amount. Qt_Sold decreases when a medicine gets sold.
	validates :medicine_qt, presence: true, numericality: { greater_than: 0 }
	validates :qt_sold, presence: true, numericality: { greater_than_or_equals: 0 }
	#PPH should exist as it determines the price of that unit.
	validates :pph, presence: true, numericality: { greater_than_or_equals: 0 }

	belongs_to :medicine
	belongs_to :bl
	


end
