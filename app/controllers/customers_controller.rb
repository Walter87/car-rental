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

class CustomersController < ApplicationController
  expose(:customer)
  expose(:customers)
  def create
    self.customer = Customer.new(customer_params)
    if customer.save
      redirect_to customers_url, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  def update
    if self.customer.update(customer_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  def destroy
    customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private

  def customer_params
    params.require(:customer).permit(:name,:surname,:address,:city,:zip_code,:notes)
  end
end
