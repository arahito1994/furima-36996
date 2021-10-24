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



end
