FactoryBot.define do
  factory :record_address do
    post_number             { '123-4567' }
    area_id                 { 2 }
    city                    { '横浜市緑区' }
    street_number           { '青山1-1-1' }
    building                { '柳ビル103' }
    telephone               { '09012345678' }
    token                   {'tok_abcdefghijk12345678901234567'}
  end
end
