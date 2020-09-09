class Receipt < ApplicationRecord

#We should discuss if empty Client names are a possibility.
validates :user_id , presence: true, numericality: { greater_than: 0 }
validates :finalpph , presence: true, numericality: { greater_than_or_equals: 0 }, allow_nil: true

has_many :medicinelogs

end
