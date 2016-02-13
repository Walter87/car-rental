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

class RentalOrder < ActiveRecord::Base
  belongs_to :customer_id
  belongs_to :user_id
  belongs_to :car_id
end
