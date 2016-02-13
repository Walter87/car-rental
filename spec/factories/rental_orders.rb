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
    
  end

end
