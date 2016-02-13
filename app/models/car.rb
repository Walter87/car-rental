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
end
