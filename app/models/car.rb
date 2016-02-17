# == Schema Information
#
# Table name: cars
#
#  id            :integer          not null, primary key
#  make          :string
#  model         :string
#  description   :text
#  comfort_class :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Car < ActiveRecord::Base
  has_many :rental_orders
  has_many :customers, through: :rental_orders

  validates :make, :model, :comfort_class, presence: true
  validates :comfort_class, inclusion: {in: %w(A B C),
    message: "%{value} is not a valid car comfort class" }

  def booked_dates
    booked_dates = []
    self.rental_orders.each do |rental_order|
      (rental_order.start_date.to_i..rental_order.end_date.to_i).step(1.day) do |date|
        booked_dates << date
      end
    end
    booked_dates
  end
end
