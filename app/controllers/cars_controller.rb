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
  before_action :pass_disabled_dates, only: :show
  def show

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
  def pass_disabled_dates
    gon.dates = car.booked_dates
  end
end
