# == Schema Information
#
# Table name: rental_orders
#
#  id          :integer          not null, primary key
#  rental_order_id :integer
#  user_id     :integer
#  car_id      :integer
#  start_date  :datetime
#  end_date    :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe RentalOrdersController, type: :controller do
  context 'when user is not logged in' do
    before do
      get :index
    end
    it { is_expected.to redirect_to user_session_path }
  end
  context 'when user is logged in' do
    login_user

    describe "GET #index" do
      it "populates an array of rental_orders" do
        rental_order = create(:rental_order, user: @user)
        get :index
        expect(controller.rental_orders).to eq([rental_order])
      end
      it "renders the :index view" do
        get :index
        expect(response).to render_template :index
      end
    end

    describe "GET #show" do
      it "assigns the requested rental_order to rental_order" do
        rental_order = create(:rental_order, user: @user)
        get :show, id: rental_order
        expect(controller.rental_order).to eq(rental_order)
      end

      it "renders the :show template" do
        get :show, id: create(:rental_order, user: @user)
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

        it "should permit strong parameteres" do
          params = {
            rental_order: {
              customer_id: create(:customer),
              car_id: create(:car),
              start_date: "2016-03-24 07:34:08",
              end_date: "2016-03-29 07:34:08",
            }
          }
          is_expected.to permit(:customer_id, :car_id,:start_date,:end_date).
          for(:create, params: params).
            on(:rental_order)
          end

          it "saves the new rental_order in the database" do
            expect {
              post :create, rental_order: attributes_with_foreign_keys(:rental_order)
              }.to change(RentalOrder,:count).by(1)
            end

            it "redirects to index page" do
              post :create, rental_order: attributes_with_foreign_keys(:rental_order)
              expect(response).to redirect_to rental_orders_url
            end

            it "will create new rental order with non booked date for the same car" do
                car = create(:car)
                create(:rental_order, user: @user)
                expect {
                  post :create, rental_order: attributes_with_foreign_keys(:rental_order, car: car,
                    start_date: "2016-06-25 07:34:08", end_date: "2016-06-28 07:34:08")
                }.to change(RentalOrder,:count).by(1)
              end

          end

        context "with invalid attributes" do
          it "does not save the new rental_order in the database" do
            expect {
              post :create, rental_order: attributes_with_foreign_keys(:invalid_rental_order)
              }.to_not change(RentalOrder,:count)
            end
            it "won't create new rental order with already booked date for the same car" do
              car = create(:car)
              create(:rental_order, user: @user, car: car)
              expect {
                post :create, rental_order: attributes_with_foreign_keys(:rental_order, car: car)
              }.to_not change(RentalOrder,:count)
            end
            it "re-renders the :new template" do
              post :create, rental_order: attributes_with_foreign_keys(:invalid_rental_order)
              expect(response).to render_template :new
            end
          end
        end
    describe "GET #edit" do
      it "renders the :edit template" do
        rental_order = create(:rental_order, user:@user)
        get :edit, id: rental_order
        expect(response).to render_template :edit
      end
    end
    describe 'PUT update' do
      before :each do
        @rental_order1 = create(:rental_order, start_date: "2016-03-24 07:34:08", end_date: "2016-03-27 07:34:08", user: @user)
      end
      context "with valid attributes" do
        it "update rental_order in the database" do
          put :update, id: @rental_order1, rental_order: attributes_with_foreign_keys(:rental_order)
          expect(controller.rental_order.start_date).to eq("2016-05-24 07:34:08")
          expect(controller.rental_order.end_date).to eq("2016-05-28 07:34:08")
        end
        it "redirects to the home page" do
          put :update, id: @rental_order1, rental_order: attributes_with_foreign_keys(:rental_order)
          expect(response).to redirect_to rental_orders_url
        end
      end
      context "with invalid attributes" do
        it "does not update the rental_order in the database" do
          put :update, id: @rental_order1, rental_order: attributes_with_foreign_keys(:rental_order, start_date: nil)
          controller.rental_order.reload
          expect(controller.rental_order.start_date).to eq("2016-03-24 07:34:08")
        end
        it "re-renders the :edit template" do
          put :update, id: @rental_order1, rental_order: attributes_with_foreign_keys(:rental_order, start_date: nil)
          expect(response).to render_template :edit
        end
      end
    end

    describe 'DELETE destroy' do
      before :each do
        @rental_order = create(:rental_order, user: @user)
      end

      it "deletes the rental_order" do
        expect{
          delete :destroy, id: @rental_order
        }.to change(RentalOrder,:count).by(-1)
      end

      it "redirects to rental_orders#index" do
        delete :destroy, id: @rental_order
        expect(response).to redirect_to rental_orders_url
      end
    end

  end
end
