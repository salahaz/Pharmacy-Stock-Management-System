class Provider < ApplicationRecord

validates :name, presence: true
#No need to force the address
validates :phone, numericality: { only_integer: true, allow_nil: true  } #, presence: true


end
