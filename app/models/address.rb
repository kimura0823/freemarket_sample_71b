class Address < ApplicationRecord
  belongs_to :user, optional: true
  validates :postcode, :prefecture, :city, :address ,presence: true
end
