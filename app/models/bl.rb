class Bl < ApplicationRecord

	#The IDs are obligatory and should be enforced to ensure the integrity of the database system.
	validates :provider_id, presence: true, numericality: { greater_than: 0 }
	validates :order_id, presence: true, numericality: { greater_than: 0 }, uniqueness: { case_sensitive: false }
	validates :user_id, presence: true, numericality: { greater_than: 0 }
	validates :finalpph, presence: true, numericality: { greater_than_or_equals: 0 }

	has_many :stocks
	has_many :medicines, through: :stocks
end
