class Item < ApplicationRecord

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :postage_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area_id
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :days_id


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

end
