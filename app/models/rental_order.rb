class RentalOrder < ActiveRecord::Base
  belongs_to :customer_id
  belongs_to :user_id
  belongs_to :car_id
end
