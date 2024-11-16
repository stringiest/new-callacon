# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :find_event, only: %i[show edit update destroy]
  
  def index
    @events = Events.all
  end

  def show
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def create
    @event = Event.new(name: params[:event][:name])
    if @event.save
      flash[:notice] = I18n.t('events_notices.create_success')
      redirect_to events_url
    else
      render 'new'
    end
  end

  def update
    if @event.update(event_params)
      flash[:notice] = I18n.t('events_notices.update_success')
      redirect_to events_url
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = I18n.t('events_notices.delete_success')
    redirect_to events_url
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name)
  end
end
