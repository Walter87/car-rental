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

FactoryGirl.define do
  factory :car do
    make  'Suzuki'
    model 'Ignis'
    description 'Small economic car with lively engine'
    comfort_class 'C'

    trait :merc do
      make 'Mercedes'
      model 'E class'
      description 'Comfortable limousine with style'
      comfort_class 'A'
    end

    trait :merc do
      make 'Opel'
      model 'Astra III'
      description 'Compact car for everyone'
      comfort_class 'B'
    end

  end
  factory :invalid_car, parent: :car do |f|
    f.make nil
  end
end
