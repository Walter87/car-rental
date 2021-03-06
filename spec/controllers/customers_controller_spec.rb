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
  context 'when user is not logged in' do
    before do
      get :index
    end
    it { is_expected.to redirect_to user_session_path }
  end
  context 'when user is logged in' do
    login_user

    describe "GET #index" do
      it "populates an array of customers" do
        customer = create(:customer)
        get :index
        expect(controller.customers).to eq([customer])
      end
      it "renders the :index view" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      it "assigns the requested customer to customer" do
        customer = create(:customer)
        get :show, id: customer
        expect(controller.customer).to eq(customer)
      end

      it "renders the :show template" do
        get :show, id: create(:customer)
        expect(response).to render_template :show
      end

    end

    describe "GET #new" do
      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end

    end

    describe "POST #create" do
      context "with valid attributes" do
        it "saves the new customer in the database" do
          expect {
            post :create, customer: attributes_for(:customer)
            }.to change(Customer,:count).by(1)
          end

        it "should permit strong parameteres" do
          params = {
            customer: {
              name: "John",
              surname: "Kowalski",
              address: "25a lubelska street",
              city: "Cracow",
              zip_code: "30-003",
            }
          }
          is_expected.to permit(:name, :surname,:address,:city,:zip_code).
            for(:create, params: params).
              on(:customer)
          end

        it "redirects to customer index page" do
          post :create, customer: attributes_for(:customer)
          expect(response).to redirect_to customers_url
        end
      end

      context "with invalid attributes" do
        it "does not save the new customer in the database" do
          expect {
            post :create, customer: attributes_for(:invalid_customer)
            }.to_not change(Customer,:count)
        end

        it "re-renders the :new template" do
          post :create, customer: attributes_for(:invalid_customer)
          expect(response).to render_template :new
        end
      end
    end

    describe "GET #edit" do

      it "renders the :edit template" do
        customer = create(:customer)
        get :edit, id: customer
        expect(response).to render_template :edit
      end
    end

    describe 'PUT update' do
      before :each do
        @customer1 = create(:customer, name: "Mike", surname: "Saint")
      end

      context "with valid attributes" do
        it "update customer in the database" do
          put :update, id: @customer1, customer: attributes_for(:customer)
          expect(controller.customer.name).to eq("John")
          expect(controller.customer.surname).to eq("Due")
        end
        it "redirects to the home page" do
          put :update, id: @customer1, customer: attributes_for(:customer)
          expect(response).to redirect_to root_url
        end
      end

      context "with invalid attributes" do

        it "does not update the customer in the database" do
          put :update, id: @customer1, customer: attributes_for(:customer, address: nil)
          controller.customer.reload
          expect(controller.customer.name).to eq('Mike')
        end

        it "re-renders the :edit template" do
          put :update, id: @customer1, customer: attributes_for(:customer, name: '')
          expect(response).to render_template :edit
        end

      end
    end
  end
end
