class Tier < ApplicationRecord

validates :name, presence: true, length: { maximum: 50 }
validates :value, presence: true, numericality: { greater_than: 0} 
validates :is_flat, presence: true #This boolean determines if the value will be added directly or if it is a percentage.

belongs_to :medicine
end
