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
  belongs_to :customer
  belongs_to :user
  belongs_to :car

  validates :customer_id, :user_id, :car_id, :start_date, :end_date, presence: true
  validate :start_date_cannot_be_in_the_past, on: :create
  validate :end_date_cannot_be_in_the_past
  validate :date_cannot_be_already_booked



  def start_date_cannot_be_in_the_past
    if start_date.present? && start_date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end

  def end_date_cannot_be_in_the_past
    if end_date.present? && end_date < Date.today
      errors.add(:end_date, "can't be in the past")
    end
  end

  def date_cannot_be_already_booked
    if car_id.present?
      Car.find_by_id(car_id).rental_orders.each do |rental_order|
        if start_date.present? && start_date.between?(rental_order.start_date,rental_order.end_date)
          errors.add(:start_date, "already booked")
        end
        if end_date.present? && end_date.between?(rental_order.start_date,rental_order.end_date)
          errors.add(:start_date, "already booked")
        end
       end
    end
  end

end
