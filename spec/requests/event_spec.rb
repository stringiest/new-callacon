# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:event) { FactoryBot.create(:event) }

  # just leave these lets at the top, and set a randomly-generated email in
  # the factory...

  context "logged-in behaviour" do
    before(context) do
      @user = FactoryBot.create(:basic_user)
      @user.confirm
    end

    before(:each) do
      sign_in @user
    end

    describe "GET #index" do
      it "should render index page" do
        get events_path
        expect(response).to render_template :index
      end
    end

    describe "Get /New" do
      it "should render new page" do
        get new_event_path
        expect(response).to render_template :new
      end
    end

    describe "Get /Edit" do
      it "should render edit page" do
        get edit_event_path(event.id)
        expect(response).to render_template :edit
      end
    end

    describe "Post /Event" do
      it "should create a event with valid attributes" do
        post '/events', params: { event: FactoryBot.attributes_for(:event) }
        expect(response).to redirect_to events_path
        expect(flash[:notice]).to eq 'Event has created successfully'
      end

      it "should not create an event with invalid attributes" do
        post '/events', params: { event: FactoryBot.attributes_for(:event, name: nil) }
        expect(response).to render_template :new
        expect(flash[:notice]).to eq nil
      end
    end

    describe "Put /Event" do
      it "should update an event with valid attributes" do
        put "/events/#{event.id}", params: { event: FactoryBot.attributes_for(:event) }
        expect(response).to redirect_to events_path
        expect(flash[:notice]).to eq 'Event has updated successfully'
      end

      it "should not update an event with invalid attributes" do
        put "/events/#{event.id}", params: { event: FactoryBot.attributes_for(:event, name: nil) }
        expect(response).to render_template :edit
        expect(flash[:notice]).to eq nil
      end
    end

    describe "Delete /Event" do
      it "should destroy an event" do
        delete "/events/#{event.id}"
        expect(response).to redirect_to events_path
        expect(flash[:notice]).to eq 'Event has deleted successfully'
      end
    end
  end
end
