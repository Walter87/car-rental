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

class RentalOrdersController < ApplicationController
  expose(:rental_order)
  expose(:rental_orders)
  def create
    self.rental_order.user_id = current_user.id
    self.rental_order = RentalOrder.new(rental_order_params)
    if rental_order.save
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if self.rental_order.update(rental_order_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def rental_order_params
    params.require(:rental_order).permit(:customer_id,:car_id,:start_date,:end_date)
  end
end
