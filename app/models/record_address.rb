class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_number, :area_id, :city, :street_number, :building, :telephone, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :street_number
    validates :telephone, format: { with: /\A[0-9]+\z/, greater_than_or_equal_to: 10, less_than_or_equal_to: 11, message: 'is invalid' }
  end
  
  def save
    record = Record.create( user_id: user_id, item_id: item_id )
    Address.create( post_number: post_number, area_id: area_id, city: city, street_number: street_number, building: building, telephone: telephone, record_id: record.id )
  end

    
end