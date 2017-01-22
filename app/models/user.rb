class User < ApplicationRecord

	#has_many :product, dependent: :destroy
	has_many :products
	validates :email, presence: true, uniqueness: true

end
