require 'spec_helper'

describe RentalOrderDecorator do
  def rental_cost
    comfort_class_cost = {'A'=> 100, 'B'=> 75, 'C'=>50}
    comfort_class_cost[self.car.comfort_class] * (((self.end_date - self.start_date)/86400).to_i + 1)
  end
end
