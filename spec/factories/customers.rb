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

FactoryGirl.define do
  factory :customer do
    name  'John'
    surname 'Due'
    address '27 Rymers Lane'
    city  'Oxford'
    zip_code 'OX42NH'
  end

end
