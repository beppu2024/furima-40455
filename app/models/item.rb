class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to :category
  belongs_to :situation
  belongs_to :expense
  belongs_to :prefecture
  belongs_to :until_day
  has_one_attached :image
  

  validates :category_id, numericality: { other_than: 1 }
  validates :situation_id, numericality: { other_than: 1 }
  validates :expense_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :until_day_id, numericality: { other_than: 1 }
  validates :image, presence: true
  validates :item, presence: true
  validates :message, presence: true
  validates :price, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
end
