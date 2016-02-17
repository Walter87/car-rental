# == Schema Information
#
# Table name: rental_orders
#
#  id          :integer          not null, primary key
#  customer_id :integer
#  user_id     :integer
#  car_id      :integer
#  start_date  :datetime
#  end_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :rental_order do
    customer
    car
    start_date "2016-05-24 07:34:08"
    end_date "2016-05-28 07:34:08"
  end

  factory :invalid_rental_order, parent: :rental_order do |f|
    f.start_date nil
  end

end
