class Sale < ApplicationRecord
  before_save { self.total_price = self.quantity_sold.to_i * (Stock.find(self.stock_id).ppv.to_i) }

  validates :stock_id, presence: true, numericality: { greater_than: 0 }
  validates :quantity_sold, presence: true, numericality: { greater_than_or_equals: 0 }
  validates :total_price, presence: true, numericality: { greater_than_or_equals: 0 }
  belongs_to :stock
end
