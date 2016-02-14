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

require 'rails_helper'

RSpec.describe CustomersController, type: :controller do

end
