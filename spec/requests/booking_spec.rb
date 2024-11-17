# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  let(:booking) { FactoryBot.create(:booking) }

  # just leave these lets at the top, and set a randomly-generated email in
  # the factory...

  context "no login necessary" do
    describe "GET #index" do
      it "should render index page" do
        get bookings_path
        expect(response).to render_template :index
      end
    end

    describe "Get /New" do
      it "should render new page" do
        get new_booking_path
        expect(response).to render_template :new
      end
    end
  end

  context "logged-in behaviour" do
    before(context) do
      @user = FactoryBot.create(:basic_user)
      @user.confirm
      @event = FactoryBot.create(:event)
    end

    before(:each) do
      sign_in @user
    end

    describe "Get /Edit" do
      it "should render edit page" do
        get edit_booking_path(booking.id)
        expect(response).to render_template :edit
      end
    end

    describe "Post /Booking" do
      it "should create a booking with valid attributes" do
        post '/bookings', params: { booking: valid_attributes }
        expect(response).to redirect_to bookings_path
        expect(flash[:notice]).to eq 'Booking has created successfully'
      end

      it "should not create a booking with invalid attributes" do
        post '/bookings', params: { booking: invalid_attributes }
        expect(response).to render_template :new
        expect(flash[:notice]).to eq nil
      end
    end

    describe "Put /Booking" do
      it "should update a booking with valid attributes" do
        put "/bookings/#{booking.id}", params: { booking: FactoryBot.attributes_for(:booking) }
        expect(response).to redirect_to bookings_path
        expect(flash[:notice]).to eq 'Booking has updated successfully'
      end

      it "should not update a booking with invalid attributes" do
        put "/bookings/#{booking.id}", params: { booking: FactoryBot.attributes_for(:booking, departure: nil) }
        expect(response).to render_template :edit
        expect(flash[:notice]).to eq nil
      end
    end

    describe "Delete /Booking" do
      it "should destroy a booking" do
        delete "/bookings/#{booking.id}"
        expect(response).to redirect_to bookings_path
        expect(flash[:notice]).to eq 'Booking has deleted successfully'
      end
    end
  end

  def valid_attributes
    FactoryBot.attributes_for(:booking, user_id: @user.id, event_id: @event.id)
  end

  def invalid_attributes
    FactoryBot.attributes_for(:booking, user_id: @user.id, event_id: @event.id, arrival: nil)
  end
end
