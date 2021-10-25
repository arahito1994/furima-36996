class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :days_id, numericality: { other_than: 1 , message: "can't be blank" }

  with_options presence: true do
    validates :image
    validates :item_name
    validates :item_text
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :area_id
    validates :days_id
    validates :price, format: { with: /\A[0-9]+\z/ }
  end

  has_one_attached :image
  belongs_to :user

end
