 class Gossip < ApplicationRecord
  validates :title,
  presence: true,
  length: { in: 3..140}

  validates :content,
  presence: true

  belongs_to :user
  has_many :join_tag_gossips, dependent: :destroy
  has_many :tags, through: :join_tag_gossips, dependent: :destroy
  has_many :comments,  dependent: :destroy
  has_many :likes,  dependent: :destroy
end