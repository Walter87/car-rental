class RentalOrderDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  def rental_cost
    comfort_class_cost = {'A'=> 100, 'B'=> 75, 'C'=>50}
    comfort_class_cost[self.car.comfort_class] * (((self.end_date - self.start_date)/86400).to_i + 1)
  end
end
