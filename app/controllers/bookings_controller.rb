# frozen_string_literal: true

class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show edit update destroy]
  before_action :new_booking, only: :create

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def edit
  end

  def create
    if @booking.save
      flash[:notice] = I18n.t('bookings_notices.create_success')
      redirect_to bookings_url
    else
      render 'new'
    end
  end

  def update
    if @booking.update(booking_params)
      flash[:notice] = I18n.t('bookings_notices.update_success')
      redirect_to bookings_url
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    flash[:notice] = I18n.t('bookings_notices.delete_success')
    redirect_to bookings_url
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:arrival,
      :departure,
      :cancellable,
      :assistance_donate,
      :assistance_claim,
      :single_person,
      :dog)
  end

  def new_booking
    @booking = Booking.new(user_id: current_user.id,
      event_id: params[:booking][:event_id],
      arrival: params[:booking][:arrival],
      departure: params[:booking][:departure],
      cancellable: params[:booking][:cancellable],
      assistance_donate: params[:booking][:assistance_donate],
      assistance_claim: params[:booking][:assistance_claim],
      single_person: params[:booking][:single_person],
      dog: params[:booking][:dog])
  end
end
