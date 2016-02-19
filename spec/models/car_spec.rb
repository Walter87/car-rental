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

require 'rails_helper'

RSpec.describe Car, :type => :model do
  it 'has a valid factory' do
    expect(build(:car)).to be_valid
  end
  it 'has an invalid factory without make' do
    expect(build(:car, make: '')).to_not be_valid
  end
  it 'has an invalid factory without model' do
    expect(build(:car, model: '')).to_not be_valid
  end
  it 'has an invalid factory with comfort_class different then inclusion assumes' do
    expect(build(:car, comfort_class: 'D')).to_not be_valid
  end
  it { is_expected.to have_many(:customers).through(:rental_orders) }

end
