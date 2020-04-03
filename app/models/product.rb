class Product < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :burden
  belongs_to_active_hash :days
  belongs_to_active_hash :status
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :deliverywayonseller
  belongs_to_active_hash :deliverywayonbuyer



  validates :name, :description, :category_id, :status_id, :price, :days_id, :burden_id, :deliveryway_id, :prefecture_id, presence: true
  
  has_many :images
  has_many :comments 
  belongs_to :category
  belongs_to :user
  accepts_nested_attributes_for :images, allow_destroy: true
  validates_associated :images
  validates :images, presence: true


end