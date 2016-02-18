require 'rails_helper'

RSpec.feature "UserActions", type: :feature do

  background do
    sign_in_with
    expect(page).to have_content 'Log out'
  end

  scenario "User creates a new car" do
    click_link 'Cars'
    expect(page).to have_content 'Make'
    click_link 'New'
    fill_in "Make", with: "Opel"
    fill_in "Model", with: "Astra"
    fill_in "Description", with: "Silver"
    fill_in "Comfort class", with: "D"
    click_button "Create Car"
    expect(page).to have_content 'is not a valid car comfort class'
    fill_in "Comfort class", with: "B"
    click_button "Create Car"
    expect(page).to have_content 'Astra'
  end

  scenario "User creates a new Customer" do
    click_link 'Customers'
    expect(page).to have_content 'Zip code'
    click_link 'New'
    fill_in "Name", with: ""
    fill_in "Surname", with: "Kowalski"
    fill_in "Address", with: "25a lubelska street"
    fill_in "City", with: "Cracow"
    fill_in "Zip code", with: "38-303"
    click_button "Create Customer"
    expect(page).to have_content "can't be blank"
    fill_in "Name", with: "John"
    click_button "Create Customer"
    expect(page).to have_content 'Customer was successfully created.'
  end

  scenario "User creates a new Rental Order" do
    customer = create(:customer)
    car = create(:car)
    rental_order = create(:rental_order, user: @user, car: car, customer: customer)
    click_link 'New Rental Order'
    expect(page).to have_content 'Start date'
    select("#{customer.name} #{customer.surname}", from: "Customer")
    select("#{car.make} #{car.model}", from: "Car")
    select("May", from: "rental_order[start_date(2i)]")
    select("24", from: "rental_order[start_date(3i)]")
    select("May", from: "rental_order[end_date(2i)]")
    select("24", from: "rental_order[end_date(3i)]")
    click_button "Create Rental order"
    expect(page).to have_content "already booked"
    select("March", from: "rental_order[start_date(2i)]")
    select("20", from: "rental_order[start_date(3i)]")
    select("March", from: "rental_order[end_date(2i)]")
    select("29", from: "rental_order[end_date(3i)]")
    click_button "Create Rental order"

  end
end
