class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :area
  belongs_to :days

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :days_id
  end

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :days_id
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is invalid' }
  end

  has_one_attached :image
  belongs_to :user
end
