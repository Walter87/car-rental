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
    it { should belong_to(:user) }
    it { should belong_to(:customer) }
    it { should belong_to(:car) }
  end
  context "validations" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:car_id) }
  end
end
