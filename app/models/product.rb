class Product < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :status, presence: true
  validates :price, presence: true

  has_many :images
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true
end

