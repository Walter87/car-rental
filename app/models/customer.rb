# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string
#  surname    :string
#  address    :string
#  city       :string
#  zip_code   :string
#  notes      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ActiveRecord::Base
  has_many :rental_orders
  has_many :cars, through: :rental_orders

  validates :name, :surname, :address, :city, :zip_code, presence: true
end
