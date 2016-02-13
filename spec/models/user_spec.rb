# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime
#  updated_at             :datetime
#

require 'rails_helper'

RSpec.describe User, :type => :model do

  context "associations" do
    it { should have_many(:rental_orders) }
  end

  context "validations" do
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_confirmation_of(:password)}
  end

  context "testing factory"do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
    it "it can't create another user with the same email" do
      create(:user)
      expect(build(:user)).to_not be_valid
    end
  end

end
