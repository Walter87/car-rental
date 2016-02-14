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
  expose(:cars)
  expose(:car)

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

  def destroy
    car.destroy
    redirect_to root_url, notice: 'Product was successfully destroyed.'
  end

  private

  def car_params
    params.require(:car).permit(:make, :model, :description, :comfort_class)
  end
end
