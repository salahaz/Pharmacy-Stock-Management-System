class User < ApplicationRecord

	before_save { name.downcase! }
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }
	validates :occupation, presence: true, length: { maximum: 24 }
	validates :password, length: { minimum: 6 }

	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
