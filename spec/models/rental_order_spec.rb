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

require 'rails_helper'

RSpec.describe RentalOrder, :type => :model do
  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to belong_to(:car) }
  end
  context "validations" do
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:customer_id) }
    it { is_expected.to validate_presence_of(:car_id) }
    it { is_expected.not_to allow_value(10.days.ago).for(:start_date) }
    it { is_expected.not_to allow_value(8.days.ago).for(:end_date) }
  end
end
