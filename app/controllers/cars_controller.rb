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

class CarsController < ApplicationController

  def show
    gon.dates = car.booked_dates
  end

  def create
    self.car = Car.new(car_params)
    if car.save
      redirect_to root_url
    else
      render :new
    end
  end

  def update
    if self.car.update(car_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :description, :comfort_class)
  end
end
