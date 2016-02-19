require 'rails_helper'

RSpec.describe CarsController, type: :controller do
  context 'when user is not logged in' do
    before do
      get :index
    end
    it { is_expected.to redirect_to user_session_path }
  end
  context 'when user is logged in' do
    login_user

    describe "GET #index" do

      it "populates an array of cars" do
        car = create(:car)
        get :index
        expect(controller.cars).to eq([car])
      end

      it "renders the :index view" do
        get :index
        expect(response).to render_template :index
      end

    end

    describe "GET #show" do
      it "assigns the requested car to car" do
        car = create(:car)
        get :show, id: car
        expect(controller.car).to eq(car)
      end

      it "renders the :show template" do
        get :show, id: create(:car)
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
        it "saves the new car in the database" do
          expect {
            post :create, car: attributes_for(:car)
            }.to change(Car,:count).by(1)
        end

        it "should permit strong parameteres" do
          params = {
            car: {
              make: "Honda",
              model: "civic",
              description: "Nice car...",
              comfort_class: "B",
            }
          }
          is_expected.to permit(:make, :model, :description, :comfort_class).
            for(:create, params: params).
              on(:car)
          end

        it "redirects to car index page" do
          post :create, car: attributes_for(:car)
          expect(response).to redirect_to root_url
        end
      end

      context "with invalid attributes" do
        it "does not save the new car in the database" do
          expect {
            post :create, car: attributes_for(:invalid_car)
            }.to_not change(Car,:count)
        end

        it "re-renders the :new template" do
          post :create, car: attributes_for(:invalid_car)
          expect(response).to render_template :new
        end
      end
    end
    describe "GET #edit" do

      it "renders the :edit template" do
        car = create(:car)
        get :edit, id: car
        expect(response).to render_template :edit
      end
    end

    describe 'PUT update' do
      before :each do
        @car1 = create(:car, make: "honda", model: "civic")
      end

      context "with valid attributes" do

        it "update car in the database" do
          put :update, id: @car1, car: attributes_for(:car)
          expect(controller.car.make).to eq("Suzuki")
          expect(controller.car.model).to eq("Ignis")
        end

        it "redirects to the home page" do
          put :update, id: @car1, car: attributes_for(:car)
          expect(response).to redirect_to root_url
        end

      end

      context "with invalid attributes" do

        it "does not update the car in the database" do
          put :update, id: @car1, car: attributes_for(:car, comfort_class: nil)
          controller.car.reload
          expect(controller.car.make).to eq('honda')
        end

        it "re-renders the :edit template" do
          put :update, id: @car1, car: attributes_for(:car, model: '', comfort_class: "D")
          expect(response).to render_template :edit
        end
      end
    end
  end
end
