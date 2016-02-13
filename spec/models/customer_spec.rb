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

require 'rails_helper'

RSpec.describe Customer, :type => :model do
  it 'has a valid factory' do
    expect(build(:customer)).to be_valid
  end
  it 'has an invalid factory without surname' do
    expect(build(:customer, surname: '')).to_not be_valid
  end
  it 'has an invalid factory without name' do
    expect(build(:customer, name: '')).to_not be_valid
  end
  it 'has an invalid factory without Address' do
    expect(build(:customer, address: '')).to_not be_valid
  end
   it 'has an invalid factory without city' do
    expect(build(:customer, city: '')).to_not be_valid
  end
   it 'has an invalid factory without zip_code' do
    expect(build(:customer, zip_code: '')).to_not be_valid
  end
  it { should have_many(:cars).through(:rental_orders) }
end
