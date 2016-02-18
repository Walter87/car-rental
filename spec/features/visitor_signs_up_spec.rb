require 'rails_helper'

RSpec.feature "VisitorSignsUps", type: :feature do
  describe "the signin process", :type => :feature do
    before :each do
      create(:user)
    end
    it "signs me up with email and password" do
      sign_up_with("mail3@example.com","pass1234")
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end

    it "signs me in with valid email and password" do
      visit '/users/sign_in'
      fill_in 'Email', :with => 'email@example.com'
      fill_in 'Password', :with => 'pass1234'
      click_button 'Log in'
      expect(page).to have_content 'Signed in successfully.'
    end

    it "won't sign me in with invalid email and password" do
      visit '/users/sign_in'
      fill_in 'Email', :with => 'bad@example.com'
      fill_in 'Password', :with => 'pass1234'
      click_button 'Log in'
      expect(page).to have_content 'Sign in'
    end
  end
end
