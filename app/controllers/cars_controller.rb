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
    if car.save
      redirect_to(car)
    else
      render :new
    end
  end

  def update
    if car.save
      redirect_to(car)
    else
      render :edit
    end
  end

  private

  def person_params # example of strong parameters
    params.require(:car).permit(:make, :model, :description, :comfort_class)
  end
end
