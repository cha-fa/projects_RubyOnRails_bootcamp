class Item < ApplicationRecord
  validates :title,
  presence: true,
  length: { in: 5..50 }

  validates :description,
  presence: true,
  length: { in: 50..150 }

  validates :price_in_cents,
  presence: true,
  numericality: { greater_than: 100 }

  validates :image_url,
  presence: true

  has_many :join_item_carts
  has_many :carts, through: :join_item_carts 

  has_many :join_table_order_items
  has_many :orders, through: :join_table_order_items

  has_one_attached :picture
end
