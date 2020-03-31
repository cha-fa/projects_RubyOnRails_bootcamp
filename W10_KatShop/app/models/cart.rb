class Cart < ApplicationRecord
  has_many :join_item_carts
  has_many :items, through: :join_item_carts 
  belongs_to :user                                                                                                   
end
